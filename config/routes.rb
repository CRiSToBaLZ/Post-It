PostitTemplate::Application.routes.draw do
  root to: 'posts#index'
  
  get 'register', to: 'users#new' #create named route called users#new
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  

  # POST /posts/3/vote
  # POST /posts/3/comments/3/vote

  resources :posts, except: [:destroy] do
    member do
      post :vote
      get :flag
    end



    resources :comments, only: [:create] do
      member do
        post :vote
        get :flag
      end
    end
  end
  resources :categories, only: [:new, :create, :show]

  resources :users

end

  #alternate votes routes perhaps better for bigger apps
  # resources :votes, only: [:create]
  # POST /votes => 'Votes#create'
  # needs two pieces of information

    # collection doesnt require id
    # #GET /posts/archives
    # collection do
    #   get :archives
    # end




