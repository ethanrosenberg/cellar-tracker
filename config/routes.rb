Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :wines, only: [:index, :new, :create, :show, :edit, :update]

  get '/register', to: 'registrations#new'
  post '/register', to: 'registrations#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'


  root "wines#index"
end
