class Chore < ActiveRecord::Base
  attr_accessible :child_id, :task_id, :due_on, :completed
  
  # Relationships
  belongs_to :child
  belongs_to :task
  
  # Named Scopes
  scope :all, order('due_on')
  scope :all, order('due_on DESC')
  scope :incomplete, where('completed = ?', false)
  scope :upcoming, where('due_on >= ?', Time.now.strftime("%Y-%m-%d"))
  scope :past, where('due_on < ?', Time.now.strftime("%Y-%m-%d"))
  scope :for_child, lambda {|child_id| where("child_id > ?", child_id) }
  
    
  # Validations
  validates_presence_of :child_id, :task_id, :due_on
  # These two cause problems with unit testing, because of timing
  # validates_inclusion_of :child_id, :in => Child.all.active.map{|c| c.id}
  # validates_inclusion_of :task_id, :in => Task.all.active.map{|t| t.id}
  
    
  # Virtual Attribute
  def status
    return "Pending" if !completed
    "Completed"
  end
end
