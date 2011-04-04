class CreateTowns < ActiveRecord::Migration
  def self.up
    create_table :towns do |t|
      t.string :name
      t.string :state
      t.text :description
      t.float :lat
      t.float :lon
      t.timestamps
    end
  end

  def self.down
    drop_table :towns
  end
end
