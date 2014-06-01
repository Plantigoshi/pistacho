class Plant < ActiveRecord::Base
  has_many :metrics

  scope :temperatures,   ->{ where(type: 'Temperatures') }
  scope :humidities,     ->{ where(type: 'Humidity') }
  scope :precipitations, ->{ where(type: 'Precipitation') }
end
