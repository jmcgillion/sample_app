Rails.application.routes.draw do

  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  
  resources :notes, only: [:index, :show, :new, :create, :edit, :update] do
    collection do
      get :search, to: "notes#search"
    end
  end

  resources :folders, only: [:show, :new, :create]

  resources :users, only: [:create]

  resources :posts, except: [:destroy]

  get '/folders/:id/posts', to: 'folders#show_posts'

  

  get '/welcome', to: 'welcome#one'

  get '/welcome2', to: 'welcome#two'

 root to: 'notes#index'

 get '/settings/favorites', to: 'settings#favorite'

end









 
 


