class ActiveRecord::Base
  def method_missing(meth, *args, &block)
    if meth.to_s =~ /^find_by_(.+)$/
      run_find_by_method($1, *args, &block)
    else
      super # You *must* call super if you don't handle the method,
            # otherwise you'll mess up Ruby's method lookup.
    end
  end

  def run_find_by_method(attrs, *args, &block)
    # Make an array of attribute names
    attrs = attrs.split('_and_')

    # #transpose will zip the two arrays together like so:
    #   [[:a, :b, :c], [1, 2, 3]].transpose
    #   # => [[:a, 1], [:b, 2], [:c, 3]]
    attrs_with_args = [attrs, args].transpose

    # Hash[] will take the passed associative array and turn it
    # into a hash like so:
    #   Hash[[[:a, 2], [:b, 4]]] # => { :a => 2, :b => 4 }
    conditions = Hash[attrs_with_args]

    # #where and #all are new AREL goodness that will find all
    # records matching our conditions
    where(conditions).all
  end
end