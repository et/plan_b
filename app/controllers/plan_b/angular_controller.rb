require_dependency "plan_b/application_controller"

module PlanB
  class AngularController < ApplicationController
    before_filter :_authenticate!

    def index
    end

    private

    def _authenticate!
      instance_eval &PlanB::Config.authenticate_with
    end
  end
end