Rails.application.routes.draw do
  root to: "home#index"

  get 'root/registrations' => 'home#registrations', as:'registration_selection'
  get 'items/index' => 'items#index'
  get '/conform_user/:user_id' => 'users#conform_user', as: 'conform_user'
  get '/logout/:user_id' => 'users#logout', as: 'logout'
  get '/conform_card/:user_id' => 'users#conform_card', as: 'conform_card'
  get '/edit_profile/:user_id' => 'users#edit_profile', as: 'edit_profile'
  get '/mypage/:user_id' => 'users#mypage', as: 'mypage'
  get '/buy_check/:item_id' => 'items#buy_check', as: 'buy_check'
  post '/buy/:item_id' => 'items#buy', as: 'buy'

  resources :items, only:[:show,:new, :create,:buy_check] do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      get 'get_brand', defaults: { format: 'json' }
      get 'get_size', defaults: { format: 'json' }
    end
  end

  resources :cards, only:[:index, :new, :create, :destroy]  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'phones', to: 'users/registrations#new_phone'
    post 'phones', to: 'users/registrations#create_phone'
  end
end
