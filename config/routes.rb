Rails.application.routes.draw do
  resources :posts , only: [:show, :create]
  resources :authors, only: [:show, :create]
end
