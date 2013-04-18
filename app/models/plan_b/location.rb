module PlanB
  class Location < ActiveRecord::Base
    validates_presence_of :name
    belongs_to :location_category
  end
end
