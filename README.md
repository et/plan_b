# Plan B

Plan B is a Rails engine that offers flexible itinerary planning.

## Why?

I'm a big planner. When I go on a trip, I do a thorough amount of research to ensure I don't return from a trip and say, "man, I wish I had seen that". Unfortunately, the trip planners out there try to throw a one size fits all package that doesn't provide the granular detail that I require when say: planning a 3 day backpacking trip. In the end, I usually end up resorting to an unstructured Google spreadsheet, but then I can't go back and perform analytics since I have little control over the data. Hence, Plan B.

Totally a work in progress. Don't use this.

## Installation

In your `Gemfile`, add the following:
    
    gem 'plan_b'

Run:

    bundle install

In `config/routes.rb`:

    mount PlanB::Engine, at: "/plan_b"
    
Finally, install and run the migrations:

    rake plan_b:install:migrations
    rake db:migrate SCOPE=plan_b

## Bring your own authentication

in `config/initializer/plan_b.rb`

```ruby
PlanB::Config.authenticate_with do |config|
  redirect_to main_app.root_path unless current_user
end
```

## TODO

How do you run konacha tests from a rails engine:
https://github.com/jfirebaugh/konacha/issues/46
