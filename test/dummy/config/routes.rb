Rails.application.routes.draw do

  get  'me' => 'application#me'
  get  'watch/:type/:id/:state' => 'application#watch'

  resources :firms, only: [:show, :index]

  #mount Watch::Engine => "/watch"

end
