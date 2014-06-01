class Plant < ActiveRecord::Base
  has_many :metrics
  has_many :temperatures, class: Temperature
  has_many :precipitations, class: Precipitation
  has_many :humidities, class: Humidity

  validates :name, :planted_at, presence: true

  def last_humidity
    humidities.last.try(:measure)
  end

  def last_temperature
    temperatures.last.try(:measure)
  end
end

