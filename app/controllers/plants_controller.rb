class PlantsController < ApplicationController
  before_filter :get_plant, only: :sync
  protect_from_forgery except: :sync

  def index
    plant = Plant.first
    redirect_to plant_path plant
  end

  def sync
    @plant.metrics << Temperature.new(measure: params['data']['Temp'])
    @plant.metrics << Humidity.new(measure: params['data']['Hum'])
    binding.pry
    render nothing: true
  end

  private

  def get_plant
    @plant = Plant.find params[:id]
  end
end

