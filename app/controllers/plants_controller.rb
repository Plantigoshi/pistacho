class PlantsController < ApplicationController
  before_filter :get_plant, only: :sync

  def index
  end

  def sync
    @plant.metrics << Temperature.new(measure: params['data']['Temp'])
    @plant.metrics << Humidity.new(measure: params['data']['Hum'])

    render nothing: true
  end

  private

  def get_plant
    @plant = Plant.find params[:id]
  end
end

