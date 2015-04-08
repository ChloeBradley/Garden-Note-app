class RemovingColumnGardenIDfromUserTableBecauseIDontNeedIt < ActiveRecord::Migration
  def change
    remove_column :users, :garden_id
  end
end
