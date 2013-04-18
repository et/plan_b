require_dependency "plan_b/application_controller"

module PlanB
  class LocationCategoriesController < ApplicationController
    respond_to :json

    def index
      @location_categories = LocationCategory.all
      respond_with @location_categories
    end
  end
end