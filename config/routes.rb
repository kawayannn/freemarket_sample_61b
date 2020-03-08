Rails.application.routes.draw do
  root to: "home#index"

  get 'root/registrations' => 'home#registrations', as:'registration_selection'
  get 'items/index' => 'items#index'
  get '/conform_user/:user_id' => 'users#conform_user', as: 'conform_user'
  get '/logout/:user_id' => 'users#logout', as: 'logout'
  get '/conform_card/:user_id' => 'users#conform_card', as: 'conform_card'
  get '/edit_profile/:user_id' => 'users#edit_profile', as: 'edit_profile'
  get '/mypage/:user_id' => 'users#mypage', as: 'mypage'
  
  

  resources :items, only:[:show,:new,:buy_check]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  devise_scope :user do
    get 'phones', to: 'users/registrations#new_phone'
    post 'phones', to: 'users/registrations#create_phone'
  end
end
