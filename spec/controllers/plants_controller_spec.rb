require 'spec_helper'

describe PlantsController do
  describe "#sync" do
    let!(:plant) { Plant.create(name: 'ruda', planted_at: Time.now) }
    let(:sensor_data) { { Hum: 60.5, Temp: 28.6 } }

    it "synchronizes plant sensor data" do
      expect{
        post :sync, id: plant.id, data: sensor_data
      }.to change{ Metric.count }.by(2)
    end

    context "sensor variables values" do
      before do
        post :sync, id: plant.id, data: sensor_data
      end

      it "saves humidity data" do
        plant.humidities.first.measure.should == 60.5
      end
    end
  end
end

