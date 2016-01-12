class RemoveColumnFromPlayers < ActiveRecord::Migration
  def change
    remove_column :players, :feature, :string
    add_column :players, :position_id, :integer
  end
end
