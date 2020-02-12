Rails.application.routes.draw do
  
  get 'items' => 'items#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'phones', to: 'users/registrations#new_phone'
    post 'phones', to: 'users/registrations#create_phone'
  end
end
