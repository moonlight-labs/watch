Rails.application.routes.draw do

  root to: 'firms#index'
  resources :firms

  mount Watch::Engine, at: '/'

end
