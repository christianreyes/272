class Attraction < ActiveRecord::Base
  attr_accessible :name, :street, :town_id, :lat, :lon
end
