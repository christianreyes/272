class AddPhotoToFriends < ActiveRecord::Migration
  def self.up
    add_column :friends, :photo, :string
  end

  def self.down
    remove_column :friends, :photo
  end
end
