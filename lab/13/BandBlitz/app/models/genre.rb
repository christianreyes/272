class Genre < ActiveRecord::Base
    has_many :band_genres
    has_many :bands, :through => :band_gengres
end
