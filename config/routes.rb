Rails.application.routes.draw do
  resources :boards do
    resources :props, only: %i[show index]
  end

  resources :props
  resources :contestants
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
