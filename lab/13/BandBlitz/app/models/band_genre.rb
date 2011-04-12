class BandGenre < ActiveRecord::Base
    belongs_to :band
    belongs_to :genre
end
