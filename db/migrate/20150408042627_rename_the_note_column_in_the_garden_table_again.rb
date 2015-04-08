class RenameTheNoteColumnInTheGardenTableAgain < ActiveRecord::Migration
  def change
    rename_column :gardens, :note, :note_id
  end
end
