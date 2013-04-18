# This migration comes from plan_b (originally 20130408193857)
class CreatePlanBItineraries < ActiveRecord::Migration
  def change
    create_table :plan_b_itineraries do |t|
      t.string :title
      t.string :slug
      t.datetime :start
      t.datetime :end
      t.text :preplanning
      t.text :summary
      t.boolean :published, default: false, null: false

      t.timestamps
    end
    add_index :plan_b_itineraries, :slug, unique: true
  end
end
