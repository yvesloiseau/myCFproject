class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  @users = User.all
end
