class StaticPagesController < ApplicationController
#  before_action :save_my_previous_url, only: [:index, :about, ]
  before_action :save_my_previous_url

  def index
  end

  def landing_page
    @featured_product = Product.first
  	@products = Product
  	@featuredBrand = "Taylor Made"
  	@brand = "TaylorMade"
  end

  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    UserMailer.contact_form(@email, @name, @message).deliver_now
  end

  private
  def save_my_previous_url
    # This is a commented line session[:previous_url] is a Rails
    #  built-in variable to save last url.
    session[:my_previous_url] = URI(request.referer || '').path
  #  session[:my_previous_url] = request_url
    @back_url = session[:my_previous_url]
 #   session[:previous_url] = @back_url
    #@back_url = "this is my session url here"
  end
end
