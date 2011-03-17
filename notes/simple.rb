class Simple
  class << self
    def count
	  "can't count"
	end
  end
  
  def initialize(name)
    @name = name
  end
  
  def talk
    puts "Simple talking"
  end
end