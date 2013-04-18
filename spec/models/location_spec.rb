require 'spec_helper'

describe PlanB::Location do
  it { should validate_presence_of(:name) }
end