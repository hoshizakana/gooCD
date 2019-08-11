Rails.application.routes.draw do

  get '/' => 'homes#top'
  get '/ranking/:genre_id' => 'homes#ranking'
  get '/carts/:user_id' => 'cart#index'
  post '/cart_items' => 'cart#create'
  patch '/cart_items/:id' => 'cart#update'
  delete '/cart_items/:id' => 'cart#destroy'
  post '/favorites/:product_id' => 'favorites#create'
  delete '/favorites/:id' => 'favorites#destroy'
  post '/orders' => 'orders#create'
  get '/orders/:user_id' => 'orders#process'
  get '/orders/:user_id/confirm' => 'orders#confirm'
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
  post '/addresses' => 'addresses#create'
  delete '/addresses/:id' => 'addresses#destroy'


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
