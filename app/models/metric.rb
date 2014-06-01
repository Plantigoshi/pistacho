class Metric < ActiveRecord::Base
  belongs_to :plant

  validates :type, :measure, presence: true
end
