class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  before_action :save_my_previous_url, only: [:index, :show, :new]

  # GET /products
  # GET /products.json
  def index
    # @products = Product.all
    if params[:q]
      search_term = params[:q]
      @products = Product.search(search_term)
    else
      @products = Product.all
    end    # search_term = params[:q]
    #respond_to :html
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @comments = @product.comments.order("created_at DESC")
    @commentsFirst = @product.comments.rating_desc.first
    @commentsLast = @product.comments.rating_desc.last
    @reviews = @product.highest_rating_comment
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
#       format.html { redirect_to "/orders", notice: 'Product was successfully created.' }
        format.html { redirect_to "/orders", notice: 'Product was successfully created.' }
#        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
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
    #  session[:my_previous_url] = request_url
    @back_url = session[:my_previous_url]
    session[:previous_url] = @back_url
    #@back_url = "this is my session url here"
  end

end
