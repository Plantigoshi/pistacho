require 'spec_helper'

describe Metric do
  it { should validate_presence_of(:type) }
  it { should validate_presence_of(:measure) }
end

