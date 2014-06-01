class PlantsController < ApplicationController
  before_filter :get_plant, only: :index

  def index
  end

  def sync
    render text: 'oki doki'
  end

  private

  def get_plant
    @plant = Plant.find params[:id]
  end
end
