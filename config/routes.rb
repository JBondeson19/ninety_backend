Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


      resources :posts

      resources :users do
        resources :image_elements
      end
  
      post '/login',    to: 'sessions#create'
      get '/logged_in', to: 'sessions#is_logged_in?'
      # delete '/logout',   to: 'sessions#destroy'


end
