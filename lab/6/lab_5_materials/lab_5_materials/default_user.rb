class AddDefaultUser < ActiveRecord::Migration
  def self.up
    # create a new User object to work with
    dad = User.new
    # set this user's basic attributes
    dad.username = "dad"
    dad.email = "dad@yipee.com"
    dad.password = "taskmaster"
    dad.password_confirmation = "taskmaster"
    # save the user to the database; raise an exception if doesn't work
    dad.save!
  end

  def self.down
    # find the default user created above
    dad = User.where("username = ?", "dad").first
    # delete the user
    User.delete dad
  end
end
