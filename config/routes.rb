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

  # This is lesson 5.1 new root page
  # get 'static_pages/index'
	 root 'static_pages#index'
  # This was my root page before  lesson 5.1 (to put back after)
   #root 'static_pages#landing_page'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
