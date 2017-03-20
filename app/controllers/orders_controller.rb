class OrdersController < ApplicationController
#  after_filter :save_my_previous_url, only: [:show, :edit, :update, :destroy]
    before_action :save_my_previous_url, only: [:show, :index, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def destroy
  end


  private
 
  def save_my_previous_url
    # This is a commented line session[:previous_url] is a Rails built-in variable to save last url. 
    session[:my_previous_url] = URI(request.referer || '').path
  #  session[:my_previous_url] = request_url
    @back_url = session[:my_previous_url]
    #@back_url = "this is my session url here"

  end


end

