class OrdersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  before_action :save_my_previous_url, only: [:show,
                                              :index,
                                              :edit,
                                              :update,
                                              :destroy]


  # GET /orders
  # GET /orders.json
  def index
    if signed_in? && !current_user.admin?
      @orders = Order.where("user_id = ?", current_user.id).order("id DESC")
                .paginate(page: params[:page], per_page: 4)
    elsif current_user.admin?
      @orders = Order.order("id DESC")
                .paginate(page: params[:page], per_page: 4)
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @most_recent_orders = Order.order("id DESC").paginate(page:
                         params[:page], per_page: 3)
  end

   # GET /users/1/edit
  def edit
  end

  def new
  end

  def create
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html do
          redirect_to @order, notice: 'Product was successfully updated.'
          end
        format.json do
          render :show, status: :ok, location: @order
        end
      else
        format.html do
          render :edit
          end
        format.json do
          render json: @order.errors, status: :unprocessable_entity
          end
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html do
        redirect_to orders_url, notice: 'The order was successfully destroyed.'
        end
      format.json { head :no_content }
    end
  end

  #  Capturing cancan exception and displaying a flash error message
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url, :alert => exception.message
  end

private

def set_order
  order_user = current_user.id
  @order = order_user.orders.find(params[:id])
end


def order_params
  params.require(:order).permit(:quantity,
                                  :net_amount,
                                  :taxes,
                                  :total_amount)
end
  def save_my_previous_url
    #  built-in variable to save last url.
    session[:my_previous_url] = URI(request.referer || '').path
    @back_url = session[:my_previous_url]
  end

end

