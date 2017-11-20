Rails.application.routes.draw do
  root to: 'bixos#index'
  resources :bixos
end
