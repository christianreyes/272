class Book < ActiveRecord::Base
    attr_accessible :title, :year_published, :publisher_id, :author_ids
    
    belongs_to :publisher
    has_many :book_authors
    has_many :authors, :through => :book_authors
    
    validates_presence_of :title
    validates_numericality_of :year_published
end
