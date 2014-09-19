NewspressoForum::Engine.routes.draw do
  resources :comments

  root 'topics#index'
  resources :topics do
    resources :comments
  end

  get '/topics/page/:page', to: 'topics#index'
  get '/topics/tagged/:tag(/:page)', to: 'topics#index'
end
