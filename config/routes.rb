Rails.application.routes.draw do
  get 'gravatars/create'

  devise_for :users, path: 'users', controllers: {
  	sessions: "users/sessions",
  	registrations: "users/registrations",
  	passwords: "users/passwords",
  	confirmations: "users/confirmations"
  }

  root "static_pages#index"

  resources :users, only: :show do
    resources :avatars, only: :create
  end

  get '/contact', to: 'static_pages#contact' 

  get '/about', to: 'static_pages#about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
