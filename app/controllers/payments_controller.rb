class PaymentsController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    @user = current_user
    token = params[:stripeToken]

    # Create the charge on Stripe's servers - this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        :amount => (@product.price*100).round,
        :currency => "cad",
        :source => token,
        :description => params[:stripeEmail]
      )

      # Create an order if the product was successfully paid
      if charge.paid
        # Calculate amounts (taxes and total amount)
        # Provincial taxes calc
        @federal_tax = (@product.price*0.05.round(2))
        @provincial_tax = (@product.price*0.09975.round(2))
        @total_taxes = (@federal_tax.round(2) + @provincial_tax.round(2))

        Order.create( :user_id => @user.id,
                      :product_id => @product.id,
                      :quantity => 1,
                      :net_amount => @product.price,
                      :taxes => @total_taxes.round(2),
                      :total_amount => (@product.price + @total_taxes.round(2)))
      end
      #redirect_to product_path(@product)
      @email = @user.email

      UserMailer.customers(@user, @product).deliver_now

    rescue Stripe::CardError => e
      # The card has been declined
      body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately, there was an error processing
                        your payment: #{err[:message]}"
    end

  end
end
