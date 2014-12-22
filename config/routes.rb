NewspressoForum::Engine.routes.draw do
  resources :comments

  root 'topics#index'
  resources :topics do
    resources :comments
    post :close, to: 'topics#close'
    post :open, to: 'topics#open'
    post :unexpire, to: 'topics#unexpire'
  end

  get '/topics/page/:page', to: 'topics#index'
  get '/topics/tagged/:tag(/:page)', to: 'topics#index'
end
