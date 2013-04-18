$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'plan_b/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.add_dependency 'friendly_id', '~> 4.0.9'
  s.add_dependency 'haml', '~> 4.0'
  s.add_dependency 'rails', '~> 3.2'
  s.add_dependency 'sass-rails', '~> 3.2'
  s.add_dependency 'zurb-foundation', '4.0.3'

  s.name        = 'plan_b'
  s.version     = PlanB::VERSION
  s.authors     = ['Eric Thomas']
  s.email       = ['eric.l.m.thomas@gmail.com']
  s.homepage    = ''
  s.summary     = 'An itinerary planning tool.'
  s.description = 'Plan B is a Rails engine that provides a flexible itinerary planning.'

  s.files = Dir['{app,config,db,lib,vendor}/**/*'] + ['Rakefile', 'README.md']
  s.test_files = Dir['test/**/*']

end
