#  discounter_5.rb
#  
#  Creating memoization using an eigenclass class with a generator using class_eval
#  Based off original example by Dave Thomas (2008)
#
#  What is really nice here is that the memoize method is completely separated 
#  from any particulars in Discounter.  Could use this code for any memoization.

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

def memoize(object, name)
  eigen = class << object; self; end    # creating our eigenclass within method
  eigen.class_eval do
    memory = Hash.new
    define_method(name) do |*args|
      if memory.has_key?(args)
        memory[args]
      else
        memory[args] = super
      end
    end                   
  end
end                                           

# TESTING
d = Discounter.new 
memoize(d, :discount)
      
puts d.discount(1,2,3)
puts d.discount(1,2,3)
puts d.discount(2,3,4)
puts d.discount(2,3,4)
puts

# BENCHMARKING
require 'benchmark'
n = 10000 
Benchmark.bmbm do |bm|
  bm.report("v5:") { n.times { d.discount(2,3,4) } }
end

# Rehearsal ---------------------------------------
# v5:   0.040000   0.000000   0.040000 (  0.042350)
# ------------------------------ total: 0.040000sec
# 
#           user     system      total        real
# v5:   0.040000   0.000000   0.040000 (  0.040671)
