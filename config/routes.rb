Rails.application.routes.draw do
  root 'welcome#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/front_load_session_data.:format' => 'sessions#front_load_session_data'

  resources :users do
    resources :user_profiles
  end

  resources :user_profiles do
    resources :business_entities
  end

  resources :cohorts

  get '/scheduler' => 'events#index'

  post '/business_entities/:id/staff' => 'business_entities#staff'

end
