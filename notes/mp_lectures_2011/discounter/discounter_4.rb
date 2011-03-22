#  discounter_4.rb
#  
#  Creating memoization by creating an eigenclass (singleton class)
#  Based off original example by Dave Thomas (2008)
#
#  This should look familiar to some of the earlier work we did 
#  with eigenclasses.  But our concerns about abstracting this 
#  further still seem to remain.  Onward and upward ...

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

d = Discounter.new

def d.discount(*skus)
  @memory ||= Hash.new        # basically initialize @memory as empty hash
  if @memory.has_key?(skus)     
    @memory[skus]
  else
    @memory[skus] = super     # will go back to Discounter for method
  end
end

def d.talk
  puts "quack"
end

# TESTING
puts d.discount(1,2,3)
puts d.discount(1,2,3)
puts d.discount(2,3,4)
puts d.discount(2,3,4)
puts

# BENCHMARKING
require 'benchmark'
n = 10000 
Benchmark.bmbm do |bm|
  bm.report("v4:") { n.times { d.discount(2,3,4) } }
end

# Rehearsal ---------------------------------------
# v4:   0.030000   0.000000   0.030000 (  0.039891)
# ------------------------------ total: 0.030000sec
# 
#           user     system      total        real
# v4:   0.040000   0.000000   0.040000 (  0.037429)