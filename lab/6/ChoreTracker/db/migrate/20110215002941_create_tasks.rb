class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.integer :id
      t.string :name
      t.integer :points
      t.boolean :active
      t.timestamps
    end
  end

  def self.down
    drop_table :tasks
  end
end
