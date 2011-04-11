class CreateBandGenres < ActiveRecord::Migration
  def self.up
    create_table :band_genres do |t|
      t.integer :band_id
      t.integer :genre_id

      t.timestamps
    end
  end

  def self.down
    drop_table :band_genres
  end
end
