class Plant < ActiveRecord::Base
  has_many :metrics

  validates :name, :planted_at, presence: true

  scope :temperatures,   ->{ where(type: 'Temperatures') }
  scope :humidities,     ->{ where(type: 'Humidity') }
  scope :precipitations, ->{ where(type: 'Precipitation') }
end
