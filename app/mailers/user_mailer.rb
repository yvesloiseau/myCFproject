class UserMailer < ApplicationMailer
  default from: "loiseau.y@gmail.com"

  def contact_form(email, name, message)
  @message = message
    mail(:from => email,
        :to => "yves.loiseau@videotron.ca",
        :subject => "A new contact form message from #{name}")
  end

  # For messages sent from the User sign-up form
  def welcome(user)
  #def welcome(email)
    @appname = "Birdy's golf store"
        mail( :to => user.email,
    #mail( :to => email,
        :subject => "Welcome to #{@appname}!")
  end

  def customers(user, product)
        #   FOR TESTING IN PREVIEW
        #    @product_name = "test product"
        #    @product_price = 289.99
        #    @product_url = "Golf_bag_Cart_Taylormade_SuperV_TJ.jpg"
        #    mail( :to => "glefebvre17@yahoo.com",
    @appname = "Birdy's golf store"
    @product_name = product.name
    @product_price = product.price
    @product_url = product.image_url
      mail( :to => user.email,
      :subject => "Confirmation for the purchase of this product: #{@product_name}!")
  end

end
