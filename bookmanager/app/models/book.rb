class Book < ActiveRecord::Base
    attr_accessible :title, :year_published, :publisher_id, :author_ids
    
    belongs_to :publisher
    has_many :bookauthors
    has_many :authors, :through => :bookauthors
    
    validates_presence_of :title
    validates_numericality_of :year_published
end
