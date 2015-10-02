require_relative '../shared/comparator'
require_relative '../shared/exchanger'
require_relative '../shared/validator'
require 'pry-byebug'

module Merge
  ##
  # Implemetation of Merge Sort see: {https://pt.wikipedia.org/wiki/Merge_sort}
  class Sort
    include Validator, Comparator

    def sort(values)
      return values if invalid_to_sort?(values)
      mid = values.length / 2

      left  = sort(values[0..mid - 1])
      right = sort(values[mid..values.length - 1])

      merge([], left, right)
    end

    private

    def merge(values, left, right)
      p "values #{values} left #{left} right #{right}"
      return values if left.empty? && right.empty?

      if left.empty?
        merged = values + [right.shift]
      elsif right.empty? || lesser?(left.first, right.first)
        merged = values + [left.shift]
      else
        merged = values + [right.shift]
      end

      merge(merged, left, right)
    end
  end
end
