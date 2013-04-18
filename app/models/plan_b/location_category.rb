module PlanB
  class LocationCategory < ActiveRecord::Base
    validates_presence_of :name
  end
end
