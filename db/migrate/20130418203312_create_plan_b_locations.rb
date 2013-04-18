class CreatePlanBLocations < ActiveRecord::Migration
  def change
    create_table :plan_b_locations do |t|
      t.string :name
      t.integer :location_category_id
      t.timestamps
    end
  end
end
