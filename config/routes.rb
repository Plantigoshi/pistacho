Rails.application.routes.draw do
  root 'plants#index'

  post 'plants/:id/sync'       => 'plants#sync', as: :plant_sync
  get  'plants/:id/sync_water' => 'plants#sync_water', as: :plant_sync_water
  post 'plants/:id/water'      => 'plants#water', as: :plant_water
  resources :plants
end

