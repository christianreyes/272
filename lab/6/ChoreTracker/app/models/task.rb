class Task < ActiveRecord::Base
    attr_accessible :id, :name, :points, :active
end
