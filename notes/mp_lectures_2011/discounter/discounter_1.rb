#  discounter_1.rb
#  
#  Creating memoization w/in the class itself
#  Based off original example by Dave Thomas (2008)
#
#  Question: does this class do discounting or memoization?  
#  There are more lines of code for memoization than for 
#  discounting.  Perhaps another approach would help ...

class Discounter 
  def initialize
    @memory = Hash.new
  end
  
  def discount(*skus) 
    if @memory.has_key?(skus)  # Note as to why not ||= in this case
      @memory[skus]
    else
      @memory[skus] = expensive_discount_calculation(*skus)
    end
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

# BENCHMARKING
require 'benchmark'
n = 10000 
Benchmark.bmbm do |bm|
  bm.report("v1:") { n.times { d.discount(2,3,4) } }
end

# Rehearsal -----------------------------------------
# v0:     0.220000   0.050000   0.270000 (  1.174736)
# v0.1:   0.050000   0.000000   0.050000 (  0.086731)
# v1:     0.030000   0.000000   0.030000 (  0.036773)
# -------------------------------- total: 0.320000sec
# 
#             user     system      total        real
# v0:     0.220000   0.040000   0.260000 (  1.192473)
# v0.1:   0.050000   0.000000   0.050000 (  0.062291)
# v1:     0.040000   0.000000   0.040000 (  0.037045)
#
# Lesson: Memoization can lead to significant performance 
# gains.  In this case, the performance of the non-memoized
# code is 32x slower than the memoized version.  Even 
# comparing the non_puts version (v0.1) to the memoized 
# version (v1), we see that v1 runs at almost half the 
# spped.  (Remember previously we established the puts  
# call as the most expensive part of the process.)

