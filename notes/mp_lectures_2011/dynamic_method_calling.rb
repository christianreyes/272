# Typical object access
fowl = "duck"
puts fowl.length # => 4
puts fowl.include?("ck") # => true 


# One way to invoke a method dynamically in ruby is to send a message to the object :
puts fowl.send(:length) # => 4
puts fowl.send(:include?,"ck") # => true


# A second way is instantiate a method object and then call it:
method_object = fowl.method(:length) 
puts method_object.call # => 4
method_object = fowl.method(:include?)
puts method_object.call('ck')  # => true


# And the third way is to use the eval method:
eval "fowl.length" # => 4
eval "fowl.include?('ck')" # => true


# Which is best?  A few benchmarks are in order:
require 'benchmark'
test = "duck" 
m = test.method(:length) 
n = 100000 
Benchmark.bmbm {|bm| 
  bm.report("reg")  { n.times { test.length } }
  bm.report("call") { n.times { m.call } } 
  bm.report("send") { n.times { test.send(:length) } } 
  bm.report("eval") { n.times { eval "test.length" } } 
}

# 
# # =================================
# # One thing to note is difference in accessing private methods
# class Duck
#   def talk
#     puts "quack"
#   end
#   
#   private  
#   def walk
#     puts "waddle" 
#   end 
# end
# 
# # Normal method calling
# mallard = Duck.new  
# mallard.walk # => private method `walk' called for #<Duck:0xf4d8> (NoMethodError)
# 
# # Sending a message
# mallard.send :walk   # => waddle
# 
# # Instantiating a method object
# mallard.method(:walk).call  # => waddle
#  
# # Using eval
# eval "mallard.walk"  # => private method `walk' called for #<Duck:0xf4d8> (NoMethodError)
# 
# # Using instance_eval
# mallard.instance_eval {walk} # => waddle
