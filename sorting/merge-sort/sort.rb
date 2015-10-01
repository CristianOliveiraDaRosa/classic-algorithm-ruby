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
      @count =0
      _sort(values, 0, values.size - 1)
    end

    private

    def _sort(values, ibegin, iend)
      @count = (@count+1)
      return [values[ibegin]] if ibegin >= iend

      mid = ((iend - ibegin) / 2) + ibegin

      left  = _sort(values, ibegin, mid)
      right = _sort(values, mid + 1 , iend)

      merge(left, right)
    end

    def merge(left, right)
      merged = []
      ir = 0
      il = 0

      total(left, right).times do
        if left[il].nil?
          merged.push(right[ir])
          ir +=1
        elsif right[ir].nil? || (left[il] <=> right[ir]) <= 0
          merged.push(left[il])
          il +=1
        else
          merged.push(right[ir])
          ir +=1
        end
      end
      merged
    end

    def total(left, right); left.size + right.size; end;
  end
end
