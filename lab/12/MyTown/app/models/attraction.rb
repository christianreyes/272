class Attraction < ActiveRecord::Base
  attr_accessible :name, :street, :town_id, :lat, :lon
  
  before_save :find_attraction_coordinates

  belongs_to :town
 
  private
    def find_attraction_coordinates
      str = self.street
      town = self.town.name
      st = self.town.state
      coord = Geokit::Geocoders::GoogleGeocoder.geocode "#{str}, #{town}, #{st}"
      if coord.success
  	    self.lat, self.lon = coord.ll.split(',')
  	  else 
  	    errors.add_to_base("Error with geocoding")
  	  end
    end
end
