class Child < ActiveRecord::Base
    attr_accessible :id, :first_name, :last_name, :active
    
    has_many :chores
    has_many :tasks, :through => :chores
    
    validates_presence_of :id, :first_name, :last_name, :active
    
    # Virtual attribute for Child model
    def name
      "#{first_name} #{last_name}"
    end
end
