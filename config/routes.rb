Rails.application.routes.draw do

  #resources :ratings
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


    get '/wines/top_rated', to: 'ratings#top_rated'

    get '/wines/library', to: 'wines#wine_library'
    
  resources :wines, only: [:index, :new, :create, :show, :edit, :update] do
    resources :ratings, only: [:show, :new, :create]
  end

  resources :wines, only: [:index, :new, :create, :show, :edit, :update]


  get '/wines/:user_id/ratings', to: 'wines#ratings'


  #testing


  #end testing


  get '/register', to: 'registrations#new'
  post '/register', to: 'registrations#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/auth/:provider/callback' => 'sessions#create'

  root "wines#index"
end
