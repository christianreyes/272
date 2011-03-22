#  discounter_9.rb
#  
#  Creating memoization writing a DSL in a block
#  Based off original example by Dave Thomas (2008)

module Memoize
  def remember(name, &block)
    
    memory = Hash.new
    
    define_method(name, &block) 
    meth = instance_method(name)
    
    define_method(name) do |*args|
      if memory.has_key?(args)
        memory[args]
      else
        memory[args] = meth.bind(self).call(*args)
      end
    end
  end
end      

class Discounter
  extend Memoize
  
  remember :discount do |*skus|
    expensive_discount_calculation(*skus)
  end                                       
  
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
d1 = Discounter.new
puts d.discount(1,2,3)
puts

# BENCHMARKING
require 'benchmark'
n = 10000 
Benchmark.bmbm do |bm|
  bm.report("v9:") { n.times { d.discount(2,3,4) } }
end

# Rehearsal ---------------------------------------
# v9:   0.040000   0.000000   0.040000 (  0.041687)
# ------------------------------ total: 0.040000sec
# 
#           user     system      total        real
# v9:   0.040000   0.000000   0.040000 (  0.040983)