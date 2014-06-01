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

    context "last sensor values" do
      before do
        post :sync, id: plant.id, data: sensor_data
      end

      its(:last_humidity)      { should == 60.5 } 
      its(:last_temperature)   { should == 28.6 }
      its(:last_solat_volt)    { should == 28.6 }
      its(:last_precipitation) { should == 1 }
      its(:last_light)         { should == 1 }
    end
  end
end

