Rails.application.routes.draw do
  root 'welcome#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :users do
    resources :user_profiles
  end

  resources :user_profiles do
    resources :business_entities
  end

  get '/scheduler' => 'events#index'

end
