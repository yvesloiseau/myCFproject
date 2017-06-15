Rails.application.routes.draw do

  #  Customized devise controller (not using it, was not workng, to be removed)
  #devise_for :users, :controllers => { registrations: 'registrations' }

  devise_for :users, :controllers => { :registrations => "user_registrations" }
  resources :users

  # nested resources for comments
  resources :products  do
    resources :comments
  end

  #resources :orders, only: [:index, :show, :create, :destroy]
  resources :orders

  get 'static_pages/index'

  get 'static_pages/about'

  get 'static_pages/contact'

  get 'static_pages/landing_page'

  post 'static_pages/thank_you'

  post 'payments/create'

	root 'static_pages#index'

  # Action cable setup
  mount ActionCable.server => '/cable'

end
