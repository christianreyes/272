class CreateFriends < ActiveRecord::Migration
  def self.up
    create_table :friends do |t|
      t.string :name
      t.string :nickname
      t.string :email
      t.string :phone
      t.string :website
      t.integer :level

      t.timestamps
    end
  end

  def self.down
    drop_table :friends
  end
end
