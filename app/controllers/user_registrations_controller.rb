class UserRegistrationsController < Devise::RegistrationsController
  def create
    super
    if @user.persisted?
      UserMailer.welcome(@user).deliver_now
      flash[:success] = "Thanks you for signing-up!"
    end
  end

  def after_sign_up_path_for(products)
    products_path #'/articles/path' # Or :prefix_to_your_route
  end

  def after_sign_in_path_for(products)
    products_path #'/articles/path' # Or :prefix_to_your_route
  end

  def after_update_path_for(products)
    products_path #'/articles/path' # Or :prefix_to_your_route
  end

  def after_resource_updated_path_for(products)
    products_path #'/articles/path' # Or :prefix_to_your_route
  end

end