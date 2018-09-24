Rails.application.routes.draw do

  devise_for :users, path: 'users', controllers: {
  	sessions: "users/sessions",
  	registrations: "users/registrations",
  	passwords: "users/passwords",
  	confirmations: "users/confirmations"
  }

  root "static_pages#index"
  get '/contact', to: 'static_pages#contact' 
  get '/about', to: 'static_pages#about'

  resources :users, only: :show do
    resources :avatars, only: [:create, :destroy]
  end
  
  resources :adventures do
    resources :posts, only: :destroy
    get "travel_picture/:id", to: "posts#travel_picture", as: "travel_picture"
    post "travel_picture", to: "posts#create_travel_picture", as: "create_travel_picture"
    get "travel_log/:id", to: "posts#travel_log", as: "travel_log"
    post "travel_log", to: "posts#create_travel_log", as: "create_travel_log"
    get "travel_video/:id", to: "posts#travel_video", as: "travel_video"
    post "travel_video", to: "posts#create_travel_video", as: "create_travel_video"
  end

  resources :tags, only: :show
end
