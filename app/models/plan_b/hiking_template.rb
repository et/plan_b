module PlanB
  class HikingTemplate < ActiveRecord::Base
    has_one :itinerary_template, as: :template

    attr_accessible :start, :end, :distance, :distance_unit, :created_at, :updated_at, :id
  end
end
