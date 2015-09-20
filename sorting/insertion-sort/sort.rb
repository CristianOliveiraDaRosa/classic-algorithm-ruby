require_relative '../shared/validator'
require_relative '../shared/exchanger'

##
# Implementation of sort using {https://pt.wikipedia.org/wiki/Insertion_sort} algorithm

module Insertion
  class Sort
    def initialize
      @exchanger = Exchanger.new
    end

    def sort(values)
      _sort(values, 0)
    end

    private
    def _sort(values, index)
      return values if Validator.invalid?(values) or values.size == index
      values = sort_back(values, index, prev_(index))
      _sort(values, next_(index))
    end

    def sort_back(values, lowest, previus)
      return values if previus < 0

      if greater_than?(values[previus], values[lowest])
        values = @exchanger.exchange(values, previus, lowest)
        lowest = previus
      end

      sort_back(values, lowest, prev_(previus))
    end

    def greater_than?(value, other)
      (nil_value(value) <=> nil_value(other)) == 1
    end

    def prev_(pointer)
      pointer - 1
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
