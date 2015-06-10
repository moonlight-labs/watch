Watch::Engine.routes.draw do
  resources :watches, only: [:index]
  post 'watches', to: 'watches#create'
  delete 'watches', to: 'watches#destroy'
end
