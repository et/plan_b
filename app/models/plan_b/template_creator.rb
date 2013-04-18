module PlanB
  class TemplateCreator
    def initialize itinerary, itinerary_params
      @itinerary = itinerary
      @templates = []
      @itinerary_params = extract_templates(itinerary_params)
    end

    def save
      @itinerary.update_attributes(@itinerary_params) && create_templates
    end

    def extract_templates itinerary_params
      @templates << itinerary_params.delete(:hiking_templates)
      itinerary_params
    end

    def create_templates
      @itinerary.itinerary_templates.destroy_all
      @templates.each do |t|
        @itinerary.itinerary_templates.create(template: PlanB::HikingTemplate.new(t))
      end
    end
  end
end