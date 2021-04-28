Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

      namespace :api do
        namespace :v1 do 
          resources :posts, :users

        end
      end
      
      post '/login', to: 'sessions#create'
  
      # delete '/logout',   to: 'sessions#destroy'


end
