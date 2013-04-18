# This migration comes from plan_b (originally 20130418203312)
class CreatePlanBLocations < ActiveRecord::Migration
  def change
    create_table :plan_b_locations do |t|
      t.string :name
      t.integer :category_id
      t.timestamps
    end
  end
end
