class AddColumnToGardenTable < ActiveRecord::Migration
  def change
    rename_column :gardens, :note_id, :note
  end
end
