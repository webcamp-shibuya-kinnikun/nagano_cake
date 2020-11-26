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
    get 'search' => 'searchs#search', as: 'search'
  end

  namespace :admins do
    resources :customers, only: [:index, :show, :edit, :update, :destroy]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :orders, only: [:index, :show, :update] do
      member do
        get :applicable_customer_index
      end
      collection do
        get :today_order_index
      end
    end
    resources :orders_datails,only: [:update]
  end

  scope module: :public do
    get '/about' => 'homes#about'
    resources :addresses, only: [:index, :create, :edit, :update, :destroy]
    post 'addresses/create2' => 'addresses#create2'
    post 'addresses/:address_id/create3' => 'addresses#create3', as: 'addresses_create3'
    get 'customers/my_page' => 'customers#show'
    get 'customer/edit' => 'customers#edit'
    patch 'customer' => 'customers#update'
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw'
    resources :items, only: [:index, :show]
    get 'orders/new' => 'orders#new'
    post 'orders' => 'orders#create'
    get 'orders/thanks' => 'orders#thanks'
    get 'orders' => 'orders#index', as: 'orders_history'
    get 'orders/:id' => 'orders#show', as: 'orders_history_detail'
    post 'orders/confirm' => 'orders#confirm'
    resources :cart_items,only: [:index,:update,:create,:destroy] do
      collection do
        delete '/' => 'cart_items#all_destroy'
      end
    end
  end
end
