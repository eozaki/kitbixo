Rails.application.routes.draw do
  root to: 'bixos#index'

  get '/bixos/:id/modalidades' => 'bixos#modalidades', as: :edit_bixo_modalidades
  post '/bixos/:id/modalidades' => 'bixos#modify_modalidades', as: :modify_bixo_modalidades
  post '/bixos/:id/nova_venda' => 'bixos#nova_venda', as: :nova_venda
  resources :bixos
  resources :modalidades
  resources :vendas, except: [:show, :new]
end
