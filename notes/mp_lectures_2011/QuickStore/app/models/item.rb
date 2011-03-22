class Item < ActiveRecord::Base
  
  extend ActiveSupport::Memoizable
  
  def discount(*skus) 
    puts "Expensive calculation for #{skus.inspect}"
    skus.inject {|m,n| m + n }
  end                                       
  
  memoize :discount

end
