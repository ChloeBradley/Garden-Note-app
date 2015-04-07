class CreateNote < ActiveRecord::Migration
  def change
    create_table :notes do |t|

      t.string :title
      t.string :note
      t.datetime :date
      t.integer :garden_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
