#  discounter_3.rb
#  
#  Creating memoization by subclassing with a generator using Class.new
#  Based off original example by Dave Thomas (2008)
#
#  This is still doing subclassing in a sense.  What we are doing is 
#  injecting a method of the same name into the call chain so we can 
#  intercept it and execute a different set of instructions (maybe).
#  However, this isn't as obvious as our earlier efforts to create 
#  metaclasses into the call chain, so onto another attempt ... 

class Discounter 
  def discount(*skus) 
    expensive_discount_calculation(*skus)
  end                                       
  
  private
  
  def expensive_discount_calculation(*skus)
    puts "Expensive calculation for #{skus.inspect}"
    skus.inject {|m,n| m + n }
  end
end

def memoize(parent, method)

  Class.new(parent) do
    memory = Hash.new
    
    define_method(method) do |*args|  # define_method explained
      if memory.has_key?(args)
        memory[args]
      else
        memory[args] = super
      end
    end
  end                                       
end

# TESTING
d = memoize(Discounter, :discount).new  # returns a class object, so use .new in this case
puts d.discount(1,2,3)
puts d.discount(1,2,3)
puts d.discount(2,3,4)
puts d.discount(2,3,4)
puts

# BENCHMARKING
require 'benchmark'
n = 10000 
Benchmark.bmbm do |bm|
  bm.report("v3:") { n.times { d.discount(2,3,4) } }
end

# v3:   0.040000   0.000000   0.040000 (  0.042144)
#------------------------------ total: 0.040000sec

#          user     system      total        real
# v3:   0.040000   0.000000   0.040000 (  0.039838)