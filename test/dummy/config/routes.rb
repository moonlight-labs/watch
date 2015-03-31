Rails.application.routes.draw do

  resources :firms, only: [:show, :index]

  #mount Watch::Engine => "/watch"

end
