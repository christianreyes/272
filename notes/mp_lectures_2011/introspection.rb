# Ruby Introspection
 
a = 5
b = "Hello"
 
# Whats is your class?
puts "Class of a : #{a.class}, class of b : #{b.class}" #=>"Class of a : Fixnum, class of b : String"
puts

# Whats is your super class?
puts "Super class of a : #{a.class.superclass}, super class of b : #{b.class.superclass}" #=>"Super class of a : Integer, super class of b : Object"
puts

# Is a.class = Fixnum ?
a.instance_of? Fixnum #=> true
 
# Is a of type Integer (does it have Integer in it's class hierarchy)?
a.is_a? Integer #=> true
 
# Or this way:
a.kind_of? Integer #=> true
 
 
# Introspection, know all the details about classes :
# List all ancestors(modules and classes) of a class
puts "=== Class Ancestors ==="
String.ancestors.each{|a| puts a}
puts

# List all modules included in a class
puts "=== Included Modules ==="
String.included_modules.each{|m| puts m} 
puts

# Check class hierarchy
String < Comparable #=> true
String < Integer #=> nil  , strings are not integers
Object < String #=> false , Not all objects are strings
 
# List ancestors of class type
puts "=== List Ancestors that are Classes ==="
String.ancestors.select{|a| a.class==Class}.each{|c| puts c}
puts

# List all methods available to an object
puts "=== List All Methods ==="
b.methods.each{|m| puts m}
puts

# Get public instance methods
puts "=== Public Instance Methods ==="
String.public_instance_methods.each{|m| puts m}
puts

# Get protected instance methods
puts "=== List Protected Instance Methods ==="
String.protected_instance_methods.each{|m| puts m}
puts

# Get private instance methods
puts "=== List Private Instance Methods ==="
String.private_instance_methods.each{|m| puts m}
puts

# Determine if methods are defined
puts "=== Test if Method Defined ==="
String.method_defined? :slice! # => true 
String.public_method_defined? :upcase # => true
String.private_method_defined? :initialize # => true 



# Working with a particular object
require 'date'
d = Date.new

def d.nonsense
  puts "Today is 02/31/2009"
end

# Get instance variables
puts "=== Date Object's Instance Variables ==="
d.instance_variables.each{|i| puts i}
d.instance_variable_defined? "@of" #=>true
puts

# Get public instance methods
puts "=== Date Object's Public Methods ==="
d.public_methods.each{|m| puts m}
puts

# Get protected instance methods
puts "=== Date Object's Protected Methods ==="
d.protected_methods.each{|m| puts m}
puts

# Get private instance methods
puts "=== Date Object's Private Methods ==="
d.private_methods.each{|m| puts m}
puts

# Get instance singleton methods
puts "=== Date Object's Singleton Methods ==="
d.singleton_methods.each{|m| puts m}
