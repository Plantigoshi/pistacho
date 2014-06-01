class PlantsController < ApplicationController
  before_filter :get_plant, except: :index
  protect_from_forgery except: [:sync, :water]

  def index
    plant = Plant.first
    redirect_to plant_path plant
  end

  def water
    @plant.update_columns water: :true
    render nothing: true
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


  def sync_water
    plant_state = @plant.water
    @plant.update_columns water: false
    render json: plant_state
  end

  private

  def get_plant
    @plant = Plant.find params[:id]
  end
end

