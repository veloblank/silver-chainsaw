Rails.application.routes.draw do
  root "props#index"

  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  post 'logout', to: "sessions#destroy"

  resources :boards do
    resources :props, only: %i[index]
  end

  resources :props
  resources :contestants
end
