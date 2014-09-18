NewspressoForum::Engine.routes.draw do
  resources :comments

  root 'topics#index'
  resources :topics do
    resources :comments
  end

  get '/topics/tagged/:tag', to: 'topics#by_tag'
end
