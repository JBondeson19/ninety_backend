Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


      resources :posts, :users

      
  
      post '/login', to: 'sessions#create'
      # delete '/logout',   to: 'sessions#destroy'


end
