# This migration comes from plan_b (originally 20130408193859)
class CreatePlanBHikingTemplates < ActiveRecord::Migration
  def change
    create_table :plan_b_hiking_templates do |t|
      t.integer :distance
      t.string :start
      t.string :end
      t.timestamps
    end
  end
end
