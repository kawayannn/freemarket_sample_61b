Rails.application.routes.draw do
  
  get 'items' => 'items#index'
  get '/conform_user/:user_id' => 'users#conform_user', as: 'conform_user'
  get '/logout/:user_id' => 'users#logout', as: 'logout'
  get '/conform_card/:user_id' => 'users#conform_card', as: 'conform_card'
  get '/edit_profile/:user_id' => 'users#edit_profile', as: 'edit_profile'
  get '/mypage/:user_id' => 'users#mypage', as: 'mypage'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
end
