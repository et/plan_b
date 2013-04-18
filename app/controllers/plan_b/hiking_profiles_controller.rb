require_dependency "plan_b/application_controller"

module PlanB
  class HikingProfilesController < ApplicationController

    def show
      @hiking_profile = HikingProfiles.find params[:id]

      respond_to do |format|
        format.json { render json: @hiking_profile }
      end
    end

    def new
      @itinerary = Itinerary.new

      respond_to do |format|
        format.json { render json: @hiking_profile }
      end
    end

    # POST /itineraries.json
    def create
      @hiking_profile = Itinerary.new(params[:itinerary])

      respond_to do |format|
        if @hiking_profile.save
          format.json { render json: @hiking_profile, status: :created, location: @hiking_profile }
        else
          format.json { render json: @hiking_profile.errors, status: :unprocessable_entity }
        end
      end
    end

    # PUT /itineraries/1.json
    def update
      @hiking_profile = Itinerary.find(params[:id])

      respond_to do |format|
        if @hiking_profile.update_attributes(params[:hiking_profile])
          format.json { head :no_content }
        else
          format.json { render json: @hiking_profile.errors, status: :unprocessable_entity }
        end
      end
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
