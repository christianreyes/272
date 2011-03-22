# # get some object helpers
# require '../kcw_extensions'
# 
# class Simple
#   def talk
#     puts "simple talking"
#   end
# end
# 
# puts Simple.superclass   # => Object
# puts Simple.object_id    # => 59640
# Simple.p_self
# Simple.p_eigenclass
# puts
# 
# simon = Simple.new      
# simon.class               # => Simple
# puts simon.object_id      # => 59530
# puts
# 
# simon.talk                # => "simple talking"
# puts
# 
# # =================
# 
# fowl = "duck"
# puts fowl.class
# 
# def fowl.talk
#   puts "quack!"
# end 
# 
# fowl.talk
# 
# fowl2 = "goose"
# #fowl2.talk
# puts
# 
# # =================
# 
# duckling = Class.new
# puts duckling
# 
# Ugly = duckling
# puts duckling
# puts
# 
# 
# # =================
# # What is self?
# 
# puts "before class, self is #{self}"
# class Duck
#   puts "inside class, self is #{self}"
#   
#   def talk
#     puts "inside instance method, self is #{self}"
#     puts "quack!"
#   end
# end
# puts "after class, self is #{self}"
# 
# d = Duck.new
# puts "after class instance created, self is #{self}"
# d.talk
# puts "after class instance, self is #{self}"
# puts
# puts "=========="
# puts d.eigenclass
# d.p_self
# d.p_eigenclass
# Duck.p_self
# Duck.p_eigenclass
# puts Duck.eigenclass
# puts
# puts "=========="

# =================
# Messing around with method_missing

class Duck
  def walk
    puts "waddle"
  end
  
  def talk
    puts "quack"
  end
  
  def method_missing(name, *args, &block)
    puts "The behavior #{name} is not yet defined for ducks"
    args.each { |a| puts "not sure what to do with the argument #{a}" } unless args.nil?
    yield if block
  end
  
end

d = Duck.new
d.talk
d.walk
d.eat
d.fly "fast"
puts
d.swim { %w[Mallard Wood Rubber].each{|d| puts "Can a #{d} swim?"}}
