require 'spec_helper'

describe Metric do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:measure) }
end
