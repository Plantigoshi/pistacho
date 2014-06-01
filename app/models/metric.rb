class Metric < ActiveRecord::Base
  validates :name, :measure, presence: true
end
