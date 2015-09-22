require_relative '../shared/validator'
require_relative '../shared/exchanger'
require_relative '../shared/comparator'

##
# Implementation of sort using {https://pt.wikipedia.org/wiki/Selection_sort} algorithm

module Selection
  class Sort
    include Exchanger, Validator, Comparator

    def sort(values)
      _sort(values, 0)
    end

    def _sort(values, index)
      return values if invalid_to_sort?(values) or values.size == index

      ilowest = lowest(values, index, next_(index))
      values = exchange(values, index, ilowest)

      _sort(values, next_(index))
    end

    private
    def lowest(values, low, current)
      return low if values.size == current
      low = current if greater?(values[low], values[current])
      lowest(values, low, next_(current))
    end

    def next_(pointer)
      pointer + 1
    end
  end
end
