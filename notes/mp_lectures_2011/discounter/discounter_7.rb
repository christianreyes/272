#  discounter_7.rb
#  
#  Creating memoization by rewriting with module
#  Based off original example by Dave Thomas (2008)
#
#  This is the approach I gravitate towards.  I create 
#  a module with the memoization code that is independent 
#  of the class and method being memoized.  I can deploy 
#  this code within the class with 'extend Memoize' and 
#  now I have a method within the class that does the 
#  work for me.  

module Memoize
  def remember(name)
    
    original = "original_#{name}" # space is illegal; can't be called by accident
    memory = Hash.new
    
    alias_method original, name
    
    define_method(name) do |*args|
      if memory.has_key?(args)
        memory[args]
      else
        memory[args] = send original, *args  # note use of 'send' method
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
  bm.report("v7:") { n.times { d.discount(2,3,4) } }
end

# Rehearsal ---------------------------------------
# v7:   0.030000   0.000000   0.030000 (  0.041631)
# ------------------------------ total: 0.030000sec
# 
#           user     system      total        real
# v7:   0.030000   0.000000   0.030000 (  0.038011)
