class Plant < ActiveRecord::Base
  has_many :metrics

  has_many :temperatures, class: Temperature
  has_many :precipitations, class: Precipitation
  has_many :humidities, class: Humidity
  has_many :solar_volts, class: SolarVolt
  has_many :lights, class: Light

  validates :name, :planted_at, presence: true

  def last_humidity
    humidities.last.try(:measure)
  end

  def last_temperature
    temperatures.last.try(:measure)
  end

  def last_solar_volt
    solar_volts.last.try(:measure)
  end

  def last_precipitation
    precipitations.last.try(:measure)
  end

  def last_light
    lights.last.try(:measure)
  end
end

