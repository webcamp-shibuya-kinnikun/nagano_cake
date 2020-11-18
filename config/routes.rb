Rails.application.routes.draw do



  devise_for :admins, controllers: {
    # registrations: 'admins/registrations',
    sessions: 'admins/sessions',
    passwords: 'admins/passwords'
  }

  devise_for :customers, controllers: {
     registrations: 'public/registrations',
     sessions: 'public/sessions',
     passwords: 'public/passwords'
  }


  root 'public/homes#top'
  namespace :admins do
    get 'homes/top'
  end
  namespace :admins do
    get 'orders_details/update'
  end
  namespace :admins do
    get 'orders/index'
    get 'orders/show'
    get 'orders/update'
  end
  namespace :admins do
    get 'genres/index'
    get 'genres/create'
    get 'genres/edit'
    get 'genres/update'
  end
  namespace :admins do
    get 'items/index'
    get 'items/new'
    get 'items/create'
    get 'items/show'
    get 'items/edit'
    get 'items/update'
  end
  namespace :admins do
    resources :customers, only: [:index, :show, :edit, :update, :destroy]
  end
  scope module: :public do
    get 'homes/top'
    get 'homes/about'

    resources :customers,only: [:show, :edit, :update] do
  		collection do
  	     get 'unsubscribe'
  	     patch 'withdraw'
  	  end
  	end

    resources :addresses,only: [:show, :create, :edit, :update, :destroy]

    get 'orders/new'
    get 'orders/confirm'
    get 'orders/create'
    get 'orders/thanks'
    get 'orders/index'
    get 'orders/show'
    get 'cart_items/index'
    get 'cart_items/update'
    get 'cart_items/destroy'
    get 'cart_items/destroy_all'
    get 'cart_items/create'
    get 'items/index'
    get 'items/show'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
