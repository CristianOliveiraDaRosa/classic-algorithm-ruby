require_relative '../shared/validator'
require_relative '../shared/exchanger'
##
# Implementation of sort using {https://pt.wikipedia.org/wiki/Selection_sort} algorithm

module Selection
  class Sort
    def sort(values)
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
      low = current if greater?(values[low], values[current])
      lowest(values, low, next_(current))
    end

    def greater?(current, compared)
      (nil_value(current) <=> nil_value(compared)) == 1
    end

    def next_(pointer)
      pointer + 1
    end

    def nil_value(value)
      return 0 if value.nil?
      value
    end
  end
end
