# lib/custom_enumerables.rb
# Like a 5-year-old:
# - Enumerable methods are "list helpers"
# - We build our own versions to learn how they work

module CustomEnumerables
  def my_each
    return enum_for(:my_each) unless block_given?

    i = 0
    while i < length
      yield self[i]
      i += 1
    end
    self
  end

  def my_map
    return enum_for(:my_map) unless block_given?

    result = []
    my_each { |x| result << yield(x) }
    result
  end
end

class Array
  include CustomEnumerables
end