Rails.application.routes.draw do
  root 'plants#index'

  post 'plants/:id/sync' => 'plants#sync', as: :plant_sync
  resources :plants
end

