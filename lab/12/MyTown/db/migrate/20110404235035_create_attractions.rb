class CreateAttractions < ActiveRecord::Migration
  def self.up
    create_table :attractions do |t|
      t.string :name
      t.string :street
      t.integer :town_id
      t.float :lat
      t.float :lon
      t.timestamps
    end
  end

  def self.down
    drop_table :attractions
  end
end
