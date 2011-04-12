class Band < ActiveRecord::Base
    has_many :band_genres
    has_many :genres, :through => :band_genres

    mount_uploader :photo, PhotoUploader
    mount_uploader :song, SongUploader
end
