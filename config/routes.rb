Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }

  devise_for :members, controllers: {
    registrations: 'members/registrations',
    sessions: 'members/sessions',
    passwords: 'members/passwords'
  }
  
  resources :members do
    resources :cart_items
    delete 'cart_items' => 'cart_items#destroy_all', as: 'cart_all_item'
    resources :orders
    resources :order_items
    resources :shipping_addresses
  end
  put "/members/:id/hide" => "members#hide", as: 'member_hide'
  
  get 'withdrawal' => 'members#withdrawal'
  
  resources :items
  
  root 'homes#top'
  get '/about' => 'homes#about'
  
  namespace :admin do 
    resources :genres
    resources :order_items
    resources :orders
    resources :members
    resources :items
    get '/homes/top' => 'homes#top'
  end

  get 'search' => 'search#search'
  
  get '/:genre_id/items' => 'items#genre', as: 'genre_item'
  get '/members/:member_id/about' => 'orders#about', as: 'order_about' 
  get '/members/:member_id/completion' => 'orders#completion', as: 'member_order_completion' 
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
