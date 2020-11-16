Rails.application.routes.draw do
  devise_for :customers
  devise_for :admins
  namespace :admins do
    get 'homes/top'
  end
  namespace :admins do
    get 'orders_datals/update'
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
    get 'items/updete'
  end
  namespace :admins do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
    get 'customers/updete'
  end
  namespace :public do
    get 'addresses/index'
    get 'addresses/create'
    get 'addresses/edit'
    get 'addresses/update'
    get 'addresses/destroy'
  end
  namespace :public do
    get 'custemers/show'
    get 'custemers/edit'
    get 'custemers/update'
    get 'custemers/unsubscribe'
    get 'custemers/withdraw'
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
