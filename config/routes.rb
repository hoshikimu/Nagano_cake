Rails.application.routes.draw do

  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }

  devise_for :members, controllers: {
    registrations: 'members/registrations',
    sessions: 'members/sessions'
  }

  resources :members do
    resources :cart_items
    resources :orders
    resources :shipping_addresses
  end
  
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


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
