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
      _sort(values, 0, values.size - 1)
    end

    private

    def _sort(values, ibegin, iend)
      return [values[ibegin]] if ibegin == iend

      mid = ((iend - ibegin) / 2) + ibegin

      left  = _sort(values, ibegin, mid)
      right = _sort(values, (mid + 1), iend)

      merge([], left, right)
    end

    def merge(values, left, right)
      p "values #{values} left #{left} right #{right}"
      return values if left.empty? && right.empty?

      if left.empty?
        merged = values + [right.shift]
      elsif right.empty? || (left.first <=> right.first) <= 0
        merged = values + [left.shift]
      else
        merged = values + [right.shift]
      end

      merge(merged, left, right)
    end
  end
end
