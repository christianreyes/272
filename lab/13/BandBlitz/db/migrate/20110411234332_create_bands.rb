class CreateBands < ActiveRecord::Migration
  def self.up
    create_table :bands do |t|
      t.string :name
      t.text :description
      t.string :playing_next
      t.datetime :when_playing_next
      t.string :photo
      t.string :song

      t.timestamps
    end
  end

  def self.down
    drop_table :bands
  end
end
