class CommentsController < ApplicationController
load_and_authorize_resource

  def index
    @product = Product.find(params[:product_id])
    @comments = Comment.all

  end

  def show
  end

  def fetch_comments
    @comments = @product.comments.order("created_at DESC").paginate(page:
                         params[:page], per_page: 3)
    respond_to do |format|
        format.js
    end
  end

  def create
    @product = Product.find(params[:product_id])
    @comment = @product.comments.new(comment_params)
    @comment.user = current_user
    @user = current_user
    @comment.save

    respond_to do |format|
      if @comment.save
        format.html { redirect_to product_path(@product),
          notice: 'Review was created successfully.' }
        format.json { render :show, status: :created, location: @product }
        # Removed the js processing
         format.js
        #redirect_to product_path(@product)
      else
        format.html { redirect_to @product,
          alert: 'Review was not saved successfully.' }
        format.json { render json: @comment.errors,
          status: :unprocessable_entity }
      end
    end
  end

  def destroy
    product = @comment.product
    @comment = product.comments.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to products_url,
        notice: 'The comment was successfully destroyed.' }
      format.json { head :no_content }
      #redirect_to product
    end
  end

private

def comment_params
  params.require(:comment).permit(:user_id, :text, :rating)
end

end
