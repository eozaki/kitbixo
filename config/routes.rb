Rails.application.routes.draw do
  root to: 'bixos#index'

  resources :bixos, only: [] do
    collection do
      resources :confirmations, only: %i(index)
    end

    member do
      resources :confirmations, only: %i(create)
    end
  end

  get '/bixos/contatos' => 'bixos#contatos', as: :contatos
  get '/bixos/:id/modalidades' => 'bixos#modalidades', as: :edit_bixo_modalidades
  post '/bixos/:id/modalidades' => 'bixos#modify_modalidades', as: :modify_bixo_modalidades

  get '/modalidades/contatos' => 'modalidades#contatos', as: :contato_modalidades

  get '/admin' => 'application#admin', as: :admin
  post '/admin/limpar_mochilas' => 'application#limpa_mochilas', as: :limpa_mochilas
  post '/admin/arruma_canecas' => 'application#arruma_canecas', as: :arruma_canecas

  resources :bixos
  resources :veteranos, except: [:show, :new]
  resources :modalidades
  resources :vendas, except: [:show, :new, :create]
  resources :pagamentos, except: [:show, :index, :new, :create]
end
