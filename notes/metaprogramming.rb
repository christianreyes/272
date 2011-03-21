module Fowllike
  def walk; "waddle"; end
  def swim; "paddle"; end
end

class Duck
  include Fowllike
  def talk; "quack"; end
end

# Mallard (@fly) -> m.eign class -> Duck < Bird (talk() (include fowllike) -> Fowllike walk() swim() -> Bird



#three ways to include a method

puts "the standard notation to call a method"

mallard = Duck.new
p mallard.talk


puts "send message to the object"
p mallard.send :talk
Duck.send :include, Fowllike
p mallard.walk

puts "use the call method to invoke a particular method"
p mallard.method(:walk).call
swimming  = mallard.method(:swim)
3.times { print swimming.call + " " }

#-----------------------------------------

Duck.instance_eval "def talk; 'quack'; end"

# adds talk to the class like a static method
# d.talk  will return an error

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

Foo.class_bar #-> undefined method
Foo.new.class_bar #-> "class_bar"
Foo.instance_bar #-> "instance_bar"
Foo.new.instance_bar #-> "undefined method instance_bar"