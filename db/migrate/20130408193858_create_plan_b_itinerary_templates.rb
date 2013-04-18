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
