class Task < ActiveRecord::Base
  attr_accessible :name, :points, :active
  
  # Relationships
  has_many :chores
  has_many :children, :through => :chores
  
  # Named scopes
  scope :all, order('name')
  scope :active, where('active = ?', true)
  
  # Validations
  validates_presence_of :name
  validates_numericality_of :points, :only_integer => true, :greater_than => 0
  
end
