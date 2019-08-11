Rails.application.routes.draw do

  get '/' => 'homes#top'
  get '/ranking/:id' => 'homes#ranking'
  get 'admin_products/new'
  get 'admin_products/index'
  get 'admin_products/show'
  get 'admin_products/edit'
  get 'admin_orders/index'
  get 'admin_orders/show'
  get 'admin_orders/edit'
  get 'admin_users/show'
  get 'admin_users/edit'
  get '/carts/:id' => 'cart#index'
  post '/cart_items' => 'cart#create'
  patch '/cart_items/:id' => 'cart#update'
  delete '/cart_items/:id' => 'cart#destroy'
  post '/favorites/:id' => 'favorites#create'
  delete '/favorites/:id' => 'favorites#destroy'
  post '/orders' => 'orders#create'
  get '/orders/:id' => 'orders#process'
  get '/orders/:id/confirm' => 'orders#confirm'
  get '/orders/complete' => 'orders#complete'
  get '/genres' => 'genres#index'
  post '/genres' => 'genres#create'
  patch '/genres/:id' => 'genres#update'
  delete '/genres/:id' => 'genres#destroy'
  get '/labels' => 'labels#index'
  post '/labels' => 'labels#create'
  patch '/labels/:id' => 'labels#update'
  delete '/labels/:id' => 'labels#destroy'
  get '/artists' => 'artists#index'
  post '/artists' => 'artists#create'
  patch '/artists/:id' => 'artists#update'
  delete '/artists/:id' => 'artists#destroy'
  get '/products' => 'products#index'
  get '/products/:id' => 'products#show'
  get '/products/' =>'products#search' #担当者が自分で修正 
  get '/users/:id' => 'users#show'
  patch '/users/:id' => 'users#update'
  get '/users/:id/edit' => 'users#edit'
  get '/users/:id/confirm' => 'users#destroy_confirm'
  get 'users/:id/orders' => 'users#orders'
  post '/adresses' => 'adresses#create'
  get '/adresses/:id' => 'adresses#destroy'

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
