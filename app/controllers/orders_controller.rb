class OrdersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  before_action :save_my_previous_url, only: [:show,
                                              :index,
                                              :edit,
                                              :update,
                                              :destroy]

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
    #  built-in variable to save last url.
    session[:my_previous_url] = URI(request.referer || '').path
    @back_url = session[:my_previous_url]
  end

end

