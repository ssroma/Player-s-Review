class AddPhotoToPlayer < ActiveRecord::Migration
  def change
    add_attachment :players, :photo
  end
end
