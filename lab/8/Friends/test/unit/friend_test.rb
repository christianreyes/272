require 'test_helper'

class FriendTest < ActiveSupport::TestCase
  # Test required fields
  should validate_presence_of(:name)
  should validate_presence_of(:email)
  should validate_presence_of(:level)
  
  
  # Test email validation
  should allow_value("fred@fred.com").for(:email)
  should allow_value("fred123@fred.net").for(:email)
  should allow_value("fred_lives@my-fred.org").for(:email)
  should allow_value("freddie@andrew.cmu.edu").for(:email)
  
  should_not allow_value("bad").for(:email)
  should_not allow_value("fred@fred,com").for(:email)
  should_not allow_value("fred lives@my-fred.org").for(:email)
  should_not allow_value("freddie@whitehouse.gov").for(:email)
  should_not allow_value(1234).for(:email)
  
  
  # Test phone validation
  should allow_value("1234567890").for(:phone)
  should allow_value("(412) 268-3259").for(:phone)
  should allow_value("412-268-3259").for(:phone)
  should allow_value("412.268.3259").for(:phone)
  
  should_not allow_value("bad").for(:phone)
  should_not allow_value("412 268 3259").for(:phone)
  should_not allow_value("412-2683-259").for(:phone)
  should_not allow_value("268-3259").for(:phone)
  should_not allow_value("(412 268-3259").for(:phone)
  
  
  # Test website validation
  should allow_value("http://www.google.com").for(:website)
  should allow_value("apidock.com").for(:website)
  should allow_value("www.microsoft.com").for(:website)
  should allow_value("http://www.heimann-family.org").for(:website)
  should allow_value("http://www.kli.org").for(:website)
  should allow_value("http://www.acac.net").for(:website)
  should allow_value("http://www.cmu.edu").for(:website)
  should allow_value("http://is.hss.cmu.edu").for(:website)
  should allow_value("www.amazon.co.uk").for(:website)
   
  should_not allow_value("bad").for(:website)
  should_not allow_value("http://www.google,com").for(:website)
  should_not allow_value("www.microsoft!.com").for(:website)
  should_not allow_value("http://www.heimann family.org").for(:website)
  should_not allow_value("http://www.kli.o").for(:website)
  
  
  # Test level validation
  should validate_numericality_of(:level)
  should allow_value(1).for(:level)
  should allow_value(2).for(:level)
  should allow_value(3).for(:level)
  should allow_value(4).for(:level)
  
  should_not allow_value("bad").for(:level)
  should_not allow_value(5).for(:level)
  should_not allow_value(2.5).for(:level)
  should_not allow_value(0).for(:level)
  should_not allow_value(-1).for(:level)
  
  
  # Set up context to test the rest...
  context "Having 3 friends" do 
    
    setup do
      @sharon = Factory.create(:friend)
      @jeria = Factory.create(:friend, :name => "Jeria Quesenberry", :nickname => "Prof. Q", :level => 4)
      @dan = Factory.create(:friend, :name => "Dan Phelps", :nickname => "Prof. Dan", :level => 3)      
    end
    
    teardown do
      @sharon.destroy
      @jeria.destroy
      @dan.destroy
    end
    
    should "have a proper all scope that puts friends in alphabetical order" do
      assert_equal ["Dan Phelps", "Jeria Quesenberry", "Sharon Blazevich"], Friend.all.map{|f| f.name}
    end
    
    should "have a by_level scope" do
      assert_equal 2, Friend.by_level(3).size
      assert_equal ["Jeria Quesenberry"], Friend.by_level(4).all.map{|f| f.name}
    end
    
    should "return the proper friendship category" do
      assert_equal "Best", @jeria.category
      assert_equal "Close", @dan.category
    end   
  end
end
