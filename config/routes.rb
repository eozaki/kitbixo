Rails.application.routes.draw do
  root to: 'bixos#index'

  get '/bixos/:id/modalidades' => 'bixos#modalidades', as: :edit_bixo_modalidades
  post '/bixos/:id/modalidades' => 'bixos#modify_modalidades', as: :modify_bixo_modalidades
  post '/bixos/:id/nova_venda' => 'bixos#nova_venda', as: :nova_venda
  put '/vendas/:id/novo_pagamento' => 'vendas#novo_pagamento', as: :novo_pagamento

  resources :bixos
  resources :veteranos, except: [:show, :new]
  resources :modalidades
  resources :vendas, except: [:show, :new, :create]
  resources :pagamentos, except: [:show, :index, :new, :create]
end
