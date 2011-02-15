class Chore < ActiveRecord::Base
    attr_accessible :id, :child_id, :task_id, :due_on, :completed
end
