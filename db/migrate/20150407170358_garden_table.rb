class GardenTable < ActiveRecord::Migration
  def change
    create_table :gardens do |t|

      t.string :season_name
      t.string :plant_type
      t.integer :user_id
      t.string :note_id

      t.timestamps null: false
    end
  end
end
