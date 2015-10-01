require_relative '../shared/comparator'
require_relative '../shared/exchanger'
require_relative '../shared/validator'
require 'pry-byebug'

##
# Implemetation of Merge Sort see: {https://pt.wikipedia.org/wiki/Merge_sort}
module Merge
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
      right = _sort(values, mid + 1 , iend)

      merge([], left, right)
    end

    def merge(values, left, right)
      # p "values #{values} left #{left} right #{right}"
      return values if left.empty? and right.empty?

      if left.empty?
        merge(values + [right.shift], left, right)

      elsif right.empty? || (left.first <=> right.first) <= 0
        merge(values + [left.shift], left, right)

      else
        merge(values + [right.shift], left, right)
      end
    end
  end
end
