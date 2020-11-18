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
    get '/top' => 'homes#top'
  end

  namespace :admins do
    resources :orders, only: [:index, :show, :update]
    resources :orders_details, only: [:update]
    resources :customers, only: [:index, :show, :edit, :update, :destroy]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
  end

  scope module: :public do
    resources :customers,only: [:show, :edit, :update] do
  		collection do
  	     get 'unsubscribe'
  	     patch 'withdraw'
  	  end
  	end
  end

 scope module: :public do
    resources :addresses, only: [:index, :create, :edit, :update, :destroy]
    resources :items, only: [:index, :show]
    get 'customers/my_page' => 'customers#show'
    get 'customers/edit' => 'customers#edit'
    patch 'customers' => 'customers#update'
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw'
    get 'orders/new' => 'orders#new'
    post 'orders/confirm' => 'orders#confirm'
    post 'orders' => 'orders#create'
    get 'orders/thanks' => 'orders#thanks'
    get 'orders' => 'orders#index'
    get 'orders/:id' => 'orders#show'
    get 'cart_items' => 'cart_items#index'
    patch 'cart_items/:id' => 'cart_items#update'
    delete 'cart_items/:id' => 'cart_items#destroy'
    delete 'cart_items/all' => 'cart_items#destroy_all'
    post 'cart_items' => 'cart_items#create'
    #get 'homes/top'
    get '/about' => 'homes#about'
  end

end
