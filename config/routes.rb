Rails.application.routes.draw do
  root 'plants#index'

  post 'plant/:id/sync' => 'plants#sync', as: :plant_sync
end

