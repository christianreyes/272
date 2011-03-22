# 
# Eval is a method that evaluates a Ruby string
p eval "3+4" # => 7
eval "def multiply(x,y) ; x*y; end"
#def multiply(x,y) ; x*y; end
p multiply(4,7) # => 28


# ===========================
# instance_eval evaluates a string containing Ruby code or
# a given block within context of the receiver (object)
# class Duck
#   def initialize
#     @breed = "mallard"
#    end
# end
# d = Duck.new
# d.instance_eval { @breed }   # => "mallard"
# d.instance_eval "def eat; 'duck_food'; end"
# p d.eat # => 
# # d2 = Duck.new
# # p d2.eat
# 
# # Can be used to define singleton class methods
# Duck.instance_eval "def talk; 'quack'; end"
# Duck.talk # => "quack"
# d.talk # => undefined method `talk' for #<Duck:0x2281c @breed="mallard"> (NoMethodError)
# 
# Duck.instance_eval{ def walk ; 'waddle'; end }
# Duck.walk # => "waddle"
# 
# Fixnum.instance_eval "def zero; 0 ; end"                                                 
# Fixnum.zero # => 0
# 
# Fixnum.instance_eval{ def ten ; 10; end }
# Fixnum.ten # => 10


# ===========================
# class_eval evaluates a string containing Ruby code or
# a given block within context of the receiver (class)

Duck.class_eval "def talk; 'quack'; end"
mallard = Duck.new
mallard.talk # => "quack"

Fixnum.class_eval "def number ; self ;end"
5.number # => 5
42.number # => 42


# can use class_eval to access private methods dynamically
module M; end
String.include M # => private method `include' called for String:Class (NoMethodError)
String.class_eval{include M} # => works


# ===========================
# Learning check: why does the following happen?  Can we explain this in light of 
# what we know about these methods and the Ruby object model?
Foo = Class.new
Foo.class_eval do
  def class_bar
    "class_bar"
  end
end
Foo.instance_eval do
  def instance_bar
    "instance_bar"
  end
end
Foo.class_bar       #=> undefined method ‘class_bar’ for Foo:Class
Foo.new.class_bar   #=> "class_bar"
Foo.instance_bar       #=> "instance_bar"
Foo.new.instance_bar   #=> undefined method ‘instance_bar’ for #<Foo:0x7dce8>

# 
# 
# # ===========================
# # We can use all this to make our own attr_accessor
# # (call this version attr_access to be safe...)
# 
# class Class
#   def attr_access(*attrs)
#     attrs.each do |attr|
#       class_eval %Q{
#       def #{attr} 
#         @#{attr}
#       end
#       def #{attr}=(value)
#         @#{attr} = value
#       end
#       }
#     end
#   end
# end
#  
# class Person 
#   attr_access :first_name, :last_name 
# end
#  
# Person.instance_methods(false) # => ["last_name", "first_name", "last_name=", "first_name="]
# 
