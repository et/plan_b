module PlanB
  class Location < ActiveRecord::Base
    validates_presence_of :name
    has_one :category
  end
end
