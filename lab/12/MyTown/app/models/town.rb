class Town < ActiveRecord::Base
  attr_accessible :name, :state, :description, :lat, :lon
end
