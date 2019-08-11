Rails.application.routes.draw do

  get '/' => 'homes#top'
  get 'homes/ranking' => ''

#Saddy's
  # admin_products
  get '/admin/products/new' => 'admin_products#new'
  get '/admin/products' => 'admin_products#index'
  get '/admin/products/:id' => 'admin_products#show'
  get '/admin/products/:id/edit' => 'admin_products#edit'
  post '/admin/products' => 'admin_products#create'
  patch '/admin/products/:id' => 'admin_products#update'
# admin_orders
  get '/admin/orders' => 'admin_orders#index'
  get '/admin/orders/:id' => 'admin_orders#show'
  get '/admin/orders/:id/edit' => 'admin_orders#edit'
  patch '/admin/orders/:id' => 'admin_orders#update'
# admin_users
  get '/admin/users' => 'admin_users#index'
  get '/admin/users/:id' => 'admin_users#show'
  get '/admin/users/:id/edit' => 'admin_users#edit'
  patch '/admin/useres/:id' => 'admin_users#update'
#end
  get 'cart/index'
  get 'orders/process'
  get 'orders/confirm'
  get 'orders/complete'
  get '/genres/index'
  get '/labels/index'
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
