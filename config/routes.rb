Rails.application.routes.draw do

  get 'homes/top' => '/'
  get 'homes/ranking'
  get 'admin_products/new'
  get 'admin_products/index'
  get 'admin_products/show'
  get 'admin_products/edit'
  get 'admin_orders/index'
  get 'admin_orders/show'
  get 'admin_orders/edit'
  get 'admin_users/show'
  get 'admin_users/edit'
  get 'cart/index'
  get 'orders/process'
  get 'orders/confirm'
  get 'orders/complete'
  get 'genres/index'
  get 'labels/index'
  get 'artists/index'
  get 'products/index'
  get 'products/show'
  get 'products/search'
  get 'users/show'
  get 'users/edit'
  get 'users/update'
  get 'users/destroy_confirm'
  get 'users/orders'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
   }
   devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
   }

end
