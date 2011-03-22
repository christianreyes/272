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

donald = Duck.new("Donald Duck", "Cartoon")

# bound = donald.talk("donald"){"...not a mouse like Mickey"}

# puts eval("self",bound)
# puts eval("@name",bound)
# puts eval("talk_sound",bound)
# puts eval("param",bound)
# puts eval("yield",bound)


# eval("talk_sound = 'QUACK!'", bound)
# puts eval("talk_sound",bound)

# ===========================
# Simple multiplier block (for bindings example)
def times_(n)
  lambda {|value| n * value }
end

times_two = times_(2)
puts times_two.call(3)
puts eval("n",times_two.binding)
puts times_two.call(3.14159)
#change the value of n to 3 in the binding...
eval("n=3",times_two.binding)
puts times_two.call(4)




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