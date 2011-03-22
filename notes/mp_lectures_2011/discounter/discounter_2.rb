#  discounter_2.rb
#  
#  Creating memoization by creating a subclass to add behavior
#  Based off original example by Dave Thomas (2008)
#
#  First effort to separate discounting from memoization is 
#  simply to create a subclass of discounter that only deals
#  with memoization.
#
#  Interestingly, the MemoDiscounter class is really parameterized 
#  by two things: the name of the parent class and the name of the 
#  method that is being memoized.  If we really want to reuse code,
#  wouldn't it make sense to abstract this further so that the 
#  memoization code is not as tightly linked to the parent class 
#  and could be reused by other classes needing memoization?

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

class MemoDiscounter < Discounter
  def initialize
    @memory = Hash.new
  end
  
  def discount(*skus) 
    if @memory.has_key?(skus)
      @memory[skus]
    else
      @memory[skus] = super  # run the method in the base class and store in @memory
    end
  end                                       
end

# TESTING
d = MemoDiscounter.new
puts d.discount(1,2,3)
puts d.discount(1,2,3)
puts d.discount(2,3,4)
puts d.discount(2,3,4)
puts

# BENCHMARKING
require 'benchmark'
n = 10000 
Benchmark.bmbm do |bm|
  bm.report("v2:") { n.times { d.discount(2,3,4) } }
end

# Rehearsal ----------------------------------------
# v1:   0.030000   0.000000   0.030000 (  0.036773)
# v2:   0.030000   0.000000   0.030000 (  0.036869)
# --------------------------------------------------
# 
#             user     system      total        real
# v1:   0.040000   0.000000   0.040000 (  0.037045)
# v2:   0.040000   0.000000   0.040000 (  0.036805)
#
