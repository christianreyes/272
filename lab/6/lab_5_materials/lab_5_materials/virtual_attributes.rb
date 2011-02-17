
# Virtual attribute for Child model
def name
  "#{first_name} #{last_name}"
end


# Virtual attribute for Chore model
def status
  return "Pending" if !completed
  "Completed"
end

