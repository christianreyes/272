class Author < ActiveRecord::Base
    attr_accessible :first_name, :last_name
    
    has_many :bookauthors
    has_many :books, :through => :bookauthors
    
    validates_presence_of :first_name, :last_name
    scope :all, :order => "last_name, first_name"
end
