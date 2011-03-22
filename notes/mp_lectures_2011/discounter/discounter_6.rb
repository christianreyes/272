#  discounter_6.rb
#  
#  Creating memoization by inline rewriting with alias_method
#  Based off original example by Dave Thomas (2008)
#
#  It appears here that I am overwriting the discount method, 
#  but before I do, I am using alias_method to give the first 
#  discount method a new alias.  That way I can still call it 
#  in the new method (rather than use 'super' which we did in 
#  earlier examples).
#
#  As interesting as this approach is, it still hardwires the 
#  memoization into a particular class.  Let's move on ...


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

class Discounter
  alias_method :_original_discount_, :discount
  def discount(*skus)
    @memory ||= Hash.new
    if @memory.has_key?(skus)
      @memory[skus]
    else
      @memory[skus] = _original_discount_(*skus)
    end
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
  bm.report("v6:") { n.times { d.discount(2,3,4) } }
end

# Rehearsal ---------------------------------------
# v6:   0.040000   0.000000   0.040000 (  0.041308)
# ------------------------------ total: 0.040000sec
# 
#           user     system      total        real
# v6:   0.040000   0.000000   0.040000 (  0.040285)
