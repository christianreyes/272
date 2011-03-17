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