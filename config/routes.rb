Rails.application.routes.draw do
  root "props#index"

  post "createOrUpdateEntry/:q", to: "props#add_prop_to_user_entry", as: "add_prop_to_user_entry"

  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"

  resources :boards do
    resources :props, only: %i[index]
  end

  resources :props
  resources :users
  get 'signup', to: "users#new", as: "signup"
  get 'leaderboard', to: "boards#leaderboard"
end
