Rails.application.routes.draw do
  devise_for :customers

  devise_for :admins, controllers: {
    # registrations: 'admins/registrations',
     sessions: 'admins/devise/sessions',
     passwords: 'admins/devise/passwords'
  }
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
  namespace :public do
    get 'addresses/index'
    get 'addresses/create'
    get 'addresses/edit'
    get 'addresses/update'
    get 'addresses/destroy'
  end

  namespace :public do
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
    get 'customers/unsubscribe'
    get 'customers/withdraw'
  end
  namespace :public do
    get 'orders/new'
    get 'orders/confirm'
    get 'orders/create'
    get 'orders/thanks'
    get 'orders/index'
    get 'orders/show'
  end
  namespace :public do
    get 'cart_items/index'
    get 'cart_items/update'
    get 'cart_items/destroy'
    get 'cart_items/destroy_all'
    get 'cart_items/create'
  end
  namespace :public do
    get 'items/index'
    get 'items/show'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
