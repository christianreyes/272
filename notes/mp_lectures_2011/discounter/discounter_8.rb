#  discounter_8.rb
#  
#  Creating memoization using bind
#  Based off original example by Dave Thomas (2008)
#  with credit to Robert Felt for original idea.
#

module Memoize
  def remember(name)
    
    memory = Hash.new
    
    original_method = instance_method(name)
    
    define_method(name) do |*args|
      if memory.has_key?(args)
        memory[args]
      else
        original = original_method.bind(self)
        memory[args] = original.call(*args)
      end
    end
  end
end      

class Discounter
  extend Memoize
  
  def discount(*skus) 
    expensive_discount_calculation(*skus)
  end                                       
  
  remember :discount
  
  private
  
  def expensive_discount_calculation(*skus)
    puts "Expensive calculation for #{skus.inspect}"
    skus.inject {|m,n| m + n }
  end
end

# TESTING
d = Discounter.new
puts d.discount(1,2,3)
puts d.discount(1,2,3)
puts d.discount(2,3,4)
puts d.discount(2,3,4)
puts

# BENCHMARKING
require 'benchmark'
n = 10000 
Benchmark.bmbm do |bm|
  bm.report("v8:") { n.times { d.discount(2,3,4) } }
end

# Rehearsal ---------------------------------------
# v8:   0.030000   0.000000   0.030000 (  0.039254)
# ------------------------------ total: 0.030000sec
# 
#           user     system      total        real
# v8:   0.040000   0.000000   0.040000 (  0.038066)
