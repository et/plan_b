PlanB::Engine.routes.draw do

  class FormatTest
    attr_accessor :mime_type

    def initialize(format)
      @mime_type = Mime::Type.lookup_by_extension(format)
    end

    def matches?(request)
      request.format == mime_type
    end
  end

  resources :hiking_profiles,     constraints: FormatTest.new(:json)
  resources :itineraries,         constraints: FormatTest.new(:json)
  resources :location_categories, constraints: FormatTest.new(:json)

  get '/*foo', to: 'angular#index', constraints: FormatTest.new(:html)
  root to: 'angular#index',         constraints: FormatTest.new(:html)
end
