require 'spec_helper'

describe PlanB::LocationCategory do
  it { should validate_presence_of(:name) }
end