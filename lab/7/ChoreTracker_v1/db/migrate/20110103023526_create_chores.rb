class CreateChores < ActiveRecord::Migration
  def self.up
    create_table :chores do |t|
      t.integer :child_id
      t.integer :task_id
      t.date :due_on
      t.boolean :completed, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :chores
  end
end
