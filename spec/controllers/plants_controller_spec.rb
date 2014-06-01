require 'spec_helper'

describe PlantsController do
  describe "#sync" do
    let!(:plant) { Plant.create(name: 'ruda', planted_at: Time.now) }

    it "synchronizes plant sensor data" do
      sensor_data = { Hum: 60.5, Temp: 28.6 }

      expect{
        post :sync, id: plant.id, data: sensor_data
      }.to change{ Metric.count }.by(2)
    end
  end
end

