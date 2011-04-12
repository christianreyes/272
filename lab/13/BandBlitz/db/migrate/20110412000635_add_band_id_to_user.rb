class AddBandIdToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :band_id, :integer
  end

  def self.down
    remove_column :users, :band_id
  end
end
