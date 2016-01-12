class AddPlayerIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :player_id, :integer
  end
end
