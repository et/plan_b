# This migration comes from plan_b (originally 20130418203948)
class CreatePlanBLocationCategories < ActiveRecord::Migration
  def change
    create_table :plan_b_location_categories do |t|
      t.string :name
      t.timestamps
    end
  end
end
