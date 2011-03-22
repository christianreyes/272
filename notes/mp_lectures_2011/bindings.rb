# class Duck
#   def initialize
#     @ivar = "Mallard"
#   end
#   
#   def talk(param)
#     lvar = "quack"
#     binding
#   end
#   
# end
# 
# d = Duck.new
# 
# bound = d.talk("...not now") { "...not ever" }
# 
# puts eval("self", bound)
# puts eval("@ivar", bound)
# puts eval("lvar", bound)
# puts eval("param", bound)
# puts eval("yield", bound)
# 
# eval("lvar = 'QUACK!'", bound)
# puts eval("lvar", bound)
# puts

 # Bindings encapsulate:
 # ---------------------
 # 1. self (and instance vars associated w/self)
 # 2. local variables
 # 3. any associated block
 # 4. return stack


#  Bindings are automatically created for blocks
#  as seen in example below:

def n_times(n)
  lambda {|value| n * value }
end

two_times = n_times(2)
p two_times
puts two_times.call(3)
# puts eval("n", two_times)
puts two_times.call(3.14159)
# eval("n=3", two_times)
# puts two_times.call(4)
