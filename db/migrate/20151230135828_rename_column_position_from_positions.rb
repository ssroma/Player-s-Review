class RenameColumnPositionFromPositions < ActiveRecord::Migration
  def change
    rename_column :positions, :position, :name
  end
end
