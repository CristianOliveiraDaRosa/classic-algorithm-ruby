require_relative '../shared/validator'
require_relative '../shared/exchanger'
require_relative '../shared/comparator'

##
# Implementation of sort using {https://pt.wikipedia.org/wiki/Insertion_sort} algorithm

module Insertion
  class Sort
    include Exchanger, Validator, Comparator

    def sort(values)
      _sort(values, 0)
    end

    private
    def _sort(values, index)
      return values if invalid_to_sort?(values) or values.size == index
      values = sort_back(values, index, prev_(index))
      _sort(values, next_(index))
    end

    def sort_back(values, lowest, previus)
      return values if previus < 0

      if greater?(values[previus], values[lowest])
        values = exchange(values, previus, lowest)
        lowest = previus
      end

      sort_back(values, lowest, prev_(previus))
    end

    def prev_(pointer)
      pointer - 1
    end

    def next_(pointer)
      pointer + 1
    end

  end
end
