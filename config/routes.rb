Watch::Engine.routes.draw do
  resources :watches, only: [:index, :create, :destroy]
end
