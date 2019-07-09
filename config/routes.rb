Rails.application.routes.draw do
  get 'admin/score_props', to: "admin#score_props", as: "score_props"
  post 'admin/score_props', to: "admin#change_score"

  root "props#index"

  post "createOrUpdateEntry/:prop_id", to: "props#add_prop_to_user_entry", as: "add_prop_to_user_entry"

  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"

  get '/auth/:provider/callback' => 'sessions#create'

  delete 'logout', to: "sessions#destroy"

  resources :boards do
    resources :props, only: %i[index new]
  end

  resources :props
  resources :users
  get 'signup', to: "users#new", as: "signup"
  get 'leaderboard', to: "boards#leaderboard"
end
