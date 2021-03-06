class Task < ActiveRecord::Base
    attr_accessible :id, :name, :points, :active
    
    has_many :chores
    has_many :children, :through => :chores
    
    validates_presence_of :id, :name, :points, :active
    validates_numericality_of :points, :greater_than => 0
    
end
