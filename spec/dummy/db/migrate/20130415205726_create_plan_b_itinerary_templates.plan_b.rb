# This migration comes from plan_b (originally 20130408193858)
class CreatePlanBItineraryTemplates < ActiveRecord::Migration
  def change
    create_table :plan_b_itinerary_templates do |t|
      t.integer :itinerary_id
      t.integer :template_id
      t.string :template_type
      t.timestamps
    end
  end
end
