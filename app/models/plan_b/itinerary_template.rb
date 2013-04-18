module PlanB
  class ItineraryTemplate < ActiveRecord::Base
    belongs_to :itinerary
    belongs_to :template, polymorphic: true

    attr_accessible :template
  end
end
