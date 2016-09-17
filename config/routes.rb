Rails.application.routes.draw do

  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/folders/choose_favorites', to: 'folders#choose_favorites'

  resources :notes, only: [:index, :show, :new, :create, :edit, :update] do
    collection do
      get :search, to: "notes#search"
    end
  end

  resources :folders, only: [:show, :new, :create] 
   

  resources :users, only: [:create, :show] do
    member do
      get :following, :followers
    end
    patch 'change_folder', on: :member
    resources :favorites, only: [:create]
  end

  get '/home', to: 'staticpages#home'
  get '/sign_up', to: 'staticpages#sign_up'
  get '/welcome', to: 'staticpages#welcome'

  resources :posts, except: [:destroy] do 
    member do
      post 'vote'
    end
    resources :comments, only: [:create]
  end

  resources :avatars, only: [:show]

  get '/folders/:id/posts', to: 'folders#show_posts'

  root to: 'notes#index'
end











 
 


