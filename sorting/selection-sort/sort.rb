require_relative '../shared/validator'
require_relative '../shared/exchanger'
require_relative '../shared/comparator'

##
# Implementation of sort using {https://pt.wikipedia.org/wiki/Selection_sort} algorithm

module Selection
  class Sort
    def sort(values)
      @comparator = Comparator.new
      @exchanger = Exchanger.new
      _sort(values, 0)
    end

    def _sort(values, index)
      return values if Validator.invalid?(values) or values.size == index

      ilowest = lowest(values, index, next_(index))
      values = @exchanger.exchange(values, index, ilowest)

      _sort(values, next_(index))
    end

    private
    def lowest(values, low, current)
      return low if values.size == current
      low = current if @comparator.this(values[low]).greater_than?(values[current])
      lowest(values, low, next_(current))
    end

    def next_(pointer)
      pointer + 1
    end
  end
end
