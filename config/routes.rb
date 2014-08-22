NewspressoForum::Engine.routes.draw do
  resources :comments

  root 'topics#index'
  resources :topics do
    resources :comments
  end
end
