NewspressoForum::Engine.routes.draw do
  resources :comments

  root 'topics#index'

  get '/topics/latest', to: 'topics#latest'
  get '/topics/top', to: 'topics#top'
  get '/topics/page/:page', to: 'topics#index'
  get '/topics/tagged/:tag(/:page)', to: 'topics#index'
  resources :topics do
    resources :comments
    post :close, to: 'topics#close'
    post :open, to: 'topics#open'
    post :unexpire, to: 'topics#unexpire'
  end
end
