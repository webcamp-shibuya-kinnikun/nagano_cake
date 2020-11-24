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
    resources :orders, only: [:index, :show, :update]
    resources :orders_details, only: [:update]
    resources :customers, only: [:index, :show, :edit, :update, :destroy]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
  end

  scope module: :public do
    resources :addresses, only: [:index, :create, :edit, :update, :destroy]
    resources :items, only: [:index, :show]
    post 'addresses/create2' => 'addresses#create2'
    post 'addresses/:address_id/create3' => 'addresses#create3', as: 'addresses_create3'
    get 'customers/my_page' => 'customers#show'
    get 'customers/edit' => 'customers#edit'
    patch 'customers' => 'customers#update'
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw'
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
    get '/about' => 'homes#about'
  end
end
