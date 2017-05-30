class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource

  before_action :save_my_previous_url, only: [:index, :show, :new]

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to products_path, :alert => exception.message
  end

  # GET /products
  # GET /products.json
  def index
    #byebug
    if params[:q]
      search_term = params[:q]
      @products = Product.search(search_term).paginate(page: params[:page],
                                              per_page: 4)
    else
      @products = Product.all.paginate(page: params[:page], per_page: 4)
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    #byebug
    @first_comment = @product.comments.rating_desc.first
    @last_comment = @product.comments.rating_desc.last
    @reviews = @product.highest_rating_comment
    @comments = @product.comments.order("created_at DESC").paginate(page:
                         params[:page], per_page: 3)
  # assuming you load the @product in prepare_product
    @product.viewed!
    #@cache_key_for_product = @product

  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html do
          redirect_to "/orders", notice: 'Product was successfully created.'
#        format.json { render :show, status: :created, location: @product }
          end
      else
        format.html do
          render :new
#        format.json { render json: @product.errors, status: :unprocessable_entity }
          end
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html do
          redirect_to @product, notice: 'Product was successfully updated.'
          end
        format.json do
          render :show, status: :ok, location: @product
        end
      else
        format.html do
          render :edit
          end
        format.json do
          render json: @product.errors, status: :unprocessable_entity
          end
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html do
        redirect_to products_url, notice: 'Product was successfully destroyed.'
        end
      format.json { head :no_content }
    end
  end

private

def set_product
  @product = Product.find(params[:id])
end

def product_params
  params.require(:product).permit(:name,
                                  :description,
                                  :product_type,
                                  :brand,
                                  :color,
                                  :price,
                                  :image_url,
                                  :top_size,
                                  :other_features,
                                  :number_of_pockets,
                                  :gender)
end

def save_my_previous_url
  session[:my_previous_url] = URI(request.referer || '').path
  @back_url = session[:my_previous_url]
  session[:previous_url] = @back_url
end

end
