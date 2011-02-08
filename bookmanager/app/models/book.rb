class Book < ActiveRecord::Base
    attr_accessible :title, :year_published, :publisher_id
end
