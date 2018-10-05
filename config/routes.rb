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
  get '/moto_trekkers', to: 'static_pages#moto_trekkers_show'
  get '/boaters', to: 'static_pages#boaters_show'
  get '/backpackers', to: 'static_pages#backpackers_show'
  get '/road-trippers-rvers', to: 'static_pages#rvers_show'
  get '/bicyclers', to: 'static_pages#bicyclers_show'

  resources :users, only: :show do
    resources :avatars, only: [:create, :destroy]
  end

  resources :posts, only: [] do
    resources :votes, only: :create, to: 'votes#create_vote' 
  end
  
  resources :adventures do
    resources :votes, only: [:create, :destroy]
    resources :posts, only: :destroy
    #get "travel_picture/:id", to: "posts#travel_picture", as: "travel_picture"
    post "travel_picture", to: "posts#create_travel_picture", as: "create_travel_picture"
    get "travel_log/:id", to: "posts#edit_log", as: "edit_travel_log"
    post "travel_log", to: "posts#create_travel_log", as: "create_travel_log"
    patch "travel_log/:id", to: "posts#update_log", as: "update_log"
    #get "travel_video/:id", to: "posts#travel_video", as: "travel_video"
    post "travel_video", to: "posts#create_travel_video", as: "create_travel_video"
  end

  resources :tags, only: :show
end
