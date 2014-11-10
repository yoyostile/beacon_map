Rails.application.routes.draw do
  resources :beacons

  root 'beacons#index'
end
