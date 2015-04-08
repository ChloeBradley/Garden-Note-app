class RemovingColumnNotesIdFromGardenTable < ActiveRecord::Migration
  def change
    remove_column :gardens, :note_id
  end
end
