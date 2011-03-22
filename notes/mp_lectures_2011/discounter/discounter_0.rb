#  discounter_0.rb
#  
#  Basic code in need of memoization
#  Based off original example by Dave Thomas (2008)


class Discounter
  def discount(*skus) 
    expensive_discount_calculation(*skus)
  end                                       
  
  def discount_no_puts(*skus) 
    expensive_discount_calculation_no_puts(*skus)
  end
  
  private
  
  def expensive_discount_calculation(*skus)
    puts "Expensive calculation for #{skus.inspect}"
    skus.inject {|m,n| m + n }
  end
  
  def expensive_discount_calculation_no_puts(*skus)
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
# require 'benchmark'
# test = Discounter.new
# n = 10000 
# Benchmark.bmbm do |bm|
#   bm.report("v0:") { n.times { test.discount(2,3,4) } }
#   bm.report("v0.1:") { n.times { test.discount_no_puts(2,3,4) } }
# end

# Rehearsal -----------------------------------------
# v0:     0.220000   0.050000   0.270000 (  1.174736)
# v0.1:   0.050000   0.000000   0.050000 (  0.086731)
# -------------------------------- total: 0.320000sec
# 
#             user     system      total        real
# v0:     0.220000   0.040000   0.260000 (  1.192473)
# v0.1:   0.050000   0.000000   0.050000 (  0.062291)
#
# Lesson: The expensive part of our expensive discount calculation 
# is the puts call, not the inject block.
