require 'sass'

module PlanB
  class Engine < ::Rails::Engine
    isolate_namespace PlanB

    initializer "zurb-foundation" do
      zurb_dir = Gem::Specification.find_by_name('zurb-foundation').gem_dir
      Sass.load_paths << File.join(zurb_dir, 'scss')
    end
  end
end
