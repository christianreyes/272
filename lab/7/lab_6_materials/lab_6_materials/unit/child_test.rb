require 'test_helper'

class ChildTest < ActiveSupport::TestCase
  
  # Start by using ActiveRecord macros


  
  
  
  
  # -------------------------------------------------
  # More shoulda testing for the other methods, etc.
  # by setting up context(s)
  #
  # Start with a simple example
  context "A new child" do
    # create the object I want with a factory with 'setup' method
    
    
    
    # write my test of name method
    
    
    
    
    # test the free method
    
    
    
    
    # now destroy the factory with 'teardown' method
    
    
  end
  
  # --------------------------------
  # Now a more complex context...
  context "Adding children with different chores" do
    # create the objects I want with factories
    setup do 
      @alex = Factory.create(:child)
      @mark = Factory.create(:child, :first_name => "Mark")
      @rachel = Factory.create(:child, :first_name => "Rachel")
      @task = Factory.create(:task)
      @chore = Factory.create(:chore, :child => @mark, :task => @task)
      @chore2 = Factory.create(:chore, :child => @rachel, :task => @task)
      @chore3 = Factory.create(:chore, :child => @rachel, :task => @task)
    end
    
    # and provide a teardown method as well
    teardown do
      @mark.destroy
      @rachel.destroy
      @alex.destroy
      @task.destroy
      @chore.destroy
      @chore2.destroy
      @chore3.destroy
    end
  
    # now run the tests:    
    # test the counting of chores
    should "shows that Mark has 1 chore" do

    end
    
    should "shows that Rachel has 2 chores" do

    end
    
    # test the free method -- should return true
    should "shows Alex has no chores yet" do

    end    
    
    # test the free method again -- should return false
    should "shows Mark still has chores to do" do

    end
    
    # test the named scope 'all'
    should "shows all the children are listed here in the right order" do

    end
    
    # finally test of name method (one would suffice, actually, but do all three)
    should "shows each has a full name" do

    end
    
  end
end
