Rails.application.routes.draw do

	# get '/orders/:user_id' => 'orders#qwerty'
  get '/' => 'homes#top'
  get '/ranking/' => 'homes#ranking' #総合ランキング表示のために追加
  get '/ranking/:genre_id' => 'homes#ranking'
  get '/carts/:user_id' => 'cart#index'
  get '/cart_items/:product_id' => 'cart#create' #'/cart_items'から変更、formがないのでget
	patch '/cart_items/:id' => 'cart#update'
  delete '/cart_items/:id' => 'cart#destroy'
  post '/favorites/:product_id' => 'favorites#favorite', as: 'favorite'
  delete '/favorites/:product_id' => 'favorites#unfavorite', as: 'unfavorite'
  post '/orders' => 'orders#create'
  post '/orders/:user_id/confirm' => 'orders#confirm'
  get '/orders/complete' => 'orders#complete'
  get '/orders/:user_id' => 'orders#procedure'
  get '/genres' => 'genres#index'
  post '/genres' => 'genres#create'
  patch '/genres/:id' => 'genres#update'
  delete '/genres/:id' => 'genres#destroy'
  get '/genres/:id/edit' => 'genres#edit' #ajax編集するために追加
  get '/labels' => 'labels#index'
  post '/labels' => 'labels#create'
  patch '/labels/:id' => 'labels#update'
  delete '/labels/:id' => 'labels#destroy'
  get '/labels/:id/edit' => 'labels#edit' #ajax編集するために追加
  get '/artists' => 'artists#index'
  post '/artists' => 'artists#create'
  patch '/artists/:id' => 'artists#update'
  delete '/artists/:id' => 'artists#destroy'
  get '/artists/:id/edit' => 'artists#edit' #ajax編集するために追加
  get '/products' => 'products#index'
  get '/products/:id' => 'products#show'
  get '/products/' =>'products#search' #担当者が自分で修正
  patch '/users/:id' => 'users#update'
  get '/users/:id/edit' => 'users#edit'
  get '/users/:id/confirm' => 'users#destroy_confirm'
  patch '/users/:id/destroy' => 'users#soft_destroy'
  get 'users/:id/orders' => 'users#orders'
  get '/addresses/:id' => 'addresses#new'
  post '/addresses/:id' => 'addresses#create'
  delete '/addresses/:screen_type/:id' => 'addresses#destroy'

#Saddy's
  # admin_products
  get '/admin/products/new' => 'admin_products#new'
  get '/admin/products' => 'admin_products#index'
  get '/admin/products/:id' => 'admin_products#show'
  get '/admin/products/:id/edit' => 'admin_products#edit'
  post '/admin/products' => 'admin_products#create'
  patch '/admin/products/:id' => 'admin_products#update'
  delete '/admin/products/:id' => 'admin_products#destroy'
# admin_orders
  get '/admin/orders' => 'admin_orders#index'
  get '/admin/orders/:id' => 'admin_orders#show'
  get '/admin/orders/:id/edit' => 'admin_orders#edit'
  patch '/admin/orders/:id' => 'admin_orders#update'
	# order_items routes
	post '/admin/orders/:id' => 'admin_orders#order_item_create'
	patch '/admin/orders/:id/:order_item_id' => 'admin_orders#order_item_update'
	delete '/admin/orders/:id/:order_item_id' => 'admin_orders#order_item_destroy'
# admin_users
  get '/admin/users' => 'admin_users#index'
  get '/admin/users/:id' => 'admin_users#show'
  get '/admin/users/:id/edit' => 'admin_users#edit'
  patch '/admin/users/:id' => 'admin_users#update'
#end

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

   #ユーザサインアップ画面を表示させるため
   get '/users/:id' => 'users#show'


end
