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
    @plant.metrics << SolarVolt.new(measure: params['data']['SolarVolt'])
    @plant.metrics << Precipitation.new(measure: params['data']['Rain'])
    @plant.metrics << Light.new(measure: params['data']['Light'])

    @plant.happy = params['data']['Status']
    @plant.save!

    render nothing: true
  end

  private

  def get_plant
    @plant = Plant.find params[:id]
  end
end

