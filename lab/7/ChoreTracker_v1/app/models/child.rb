class Child < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :active
  
  # Relationships
  has_many :chores
  has_many :tasks, :through => :chores
  
  # Named scopes
  scope :all, order('last_name, first_name')
  scope :active, where('active = ?', true)
  
  # Validations
  validates_presence_of :first_name, :last_name
  validates_format_of :first_name, :with => /^[A-Z][a-zA-Z ]+$/
  validates_format_of :last_name, :with => /^[A-Z][a-zA-Z .-]+$/

  # Virtual attribute
  def name
    "#{first_name} #{last_name}"
  end
  
  # Method to test if child has no chores
  def free?
    self.chores.size == 0
  end
  
end
