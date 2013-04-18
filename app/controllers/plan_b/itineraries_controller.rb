require_dependency "plan_b/application_controller"

module PlanB
  class ItinerariesController < ApplicationController
    respond_to :json

    def index
      @itineraries = Itinerary.all
      respond_with @itineraries
    end

    def show
      @itinerary = Itinerary.find(params[:id])
      respond_with @itinerary.to_json(include: :hiking_templates)
    end

    def new
      @itinerary = Itinerary.new
      respond_with @itinerary
    end

    def create
      @itinerary = PlanB::Itinerary.new params[:itinerary]
      @itinerary.save
      respond_with @itinerary
    end

    # PUT /itineraries/1.json
    def update
      @itinerary = PlanB::TemplateCreator.new(Itinerary.find(params[:id]), params[:itinerary])
      @itinerary.save
      respond_with @itinerary
    end

    # DELETE /itineraries/1
    # DELETE /itineraries/1.json
    def destroy
      @itinerary = Itinerary.find(params[:id])
      @itinerary.destroy

      respond_to do |format|
        format.json { head :no_content }
      end
    end
  end
end
