# Add this class and its two instances to your code:
class Duck
  attr_reader :name, :breed
   
  def initialize(name, breed)
    @name = name
    @breed = breed
   end
    
   def talk(param)
     if param == "regular"
       talk_sound = "quack"
     elsif param == "rubber"
       talk_sound = "squeek"
     elsif param == "donald"
       talk_sound = "garbled"
     else
       talk_sound = "none"
     end
     binding
   end
    
   private
   # this is embarassing for him, so it's private...
   def counting
     puts "hard to do right"
   end
end

# ===========================
# Creating a Mathemagic class
module Mathemagical
  def self.create_multiplier(n)
	
	define_method("times_#{n}") do |var|
		var * n
	end
  
  end
   
  # generate create_multiplier methods here...
  
  
  #101.times {|i| create_multiplier(i)}
   
  # advancing to method_missing...
  def method_missing(method, *args)
	if /times_(\d+)/.match(method.to_s) || /x(\d+)/.match(method.to_s)
		n = $1.to_i
		args[0] * n
 
    end
  end
end

# run these tests and make sure it is all working
p 3.times_3
p 3.14159.times_4
p 3.exp(4)
p 3.exp(1,2,3,4)
p 3.divided_by(0)
p 3.divided_by(0) { puts "IDIOT!  Everyone knows dividing by zero is wrong." 

# mm = Mathemagic.new
# p mm.times_0 2
# p mm.times_2 5
# p mm.times_3 4

class Numeric
	include Mathemagical
end
# bound = donald.talk("donald"){"...not a mouse like Mickey"}

# puts eval("self",bound)
# puts eval("@name",bound)
# puts eval("talk_sound",bound)
# puts eval("param",bound)
# puts eval("yield",bound)


# eval("talk_sound = 'QUACK!'", bound)
# puts eval("talk_sound",bound)

#donald.counting
#donald.send(:counting)
#donald.method(:counting).call
#eval "donald.counting"

# puts donald.length
# puts donald.send(:length)
# puts donald.method(:length).call
# eval "puts donald.length"

# require 'benchmark'
# n = 100000

# Benchmark.bmbm do |bm|
	# bm.report("trad"){n.times{donald.length}}
	# bm.report("send"){n.times{donald.send(:length)}}
	# bm.report("method"){n.times{donald.method(:length).call}}
	# bm.report("eval"){n.times{eval "donald.length"}}
# end


# ===========================
# # Simple multiplier block (for bindings example)
# def times_(n)
  # lambda {|value| n * value }
# end

# times_two = times_(2)
# puts times_two.call(3)
# puts eval("n",times_two.binding)
# puts times_two.call(3.14159)
# #change the value of n to 3 in the binding...
# eval("n=3",times_two.binding)
# puts times_two.call(4)

# donald = Duck.new("Donald Duck", "Cartoon") 
# mallard = Duck.new("Good Duck", "Mallard")

# donald.instance_eval "def fly; 'Donald never flies'; end"

# # puts donald.fly
# # puts mallard.fly
# # puts Duck.fly

# Duck.instance_eval "def swim; 'swimmer'; end"

# puts Duck.swim
# #puts donald.swim #does not work

# Duck.instance_eval{def walk; 'waddle';end}
# puts Duck.walk

# Duck.class_eval "def fly; 'real ducks fly'; end"
# puts mallard.fly
# puts donald.fly
# #Duck.fly #undefined method