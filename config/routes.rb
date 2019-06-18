Rails.application.routes.draw do
  root "props#index"
  resources :boards do
    resources :props, only: %i[index]
  end

  resources :props
  resources :contestants
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
