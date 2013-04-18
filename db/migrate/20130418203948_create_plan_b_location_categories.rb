class CreatePlanBLocationCategories < ActiveRecord::Migration
  def change
    create_table :plan_b_location_categories do |t|
      t.string :name
      t.timestamps
    end
  end
end
