Rails.application.routes.draw do
	# resources :products
 	resources :products

  resources :orders, only: [:index, :show, :create, :destroy]

  get 'static_pages/index'

  get 'static_pages/about'

  get 'static_pages/contact'

  get 'static_pages/landing_page'

# This is lesson 5.1 new root page
  # get 'static_pages/index'
	 root 'static_pages#index'
# This was my root page before  lesson 5.1 (to put back after)
   #root 'static_pages#landing_page'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
