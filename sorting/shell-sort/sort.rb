require_relative '../shared/validator'
require_relative '../shared/exchanger'
require_relative '../shared/comparator'

##
# Implementation of sort using {https://pt.wikipedia.org/wiki/Insertion_sort} algorithm

module Shell
  class Sort
    include Exchanger, Validator, Comparator

    def sort(values)
      return values if invalid_to_sort?(values)
      @h = calcule_h(values.size,1)
      _sort(values, 0)
    end

    private
    def _sort(values, index)
      if values.size <= index
        @h = half(@h)
        index = 0
      end
      return values if @h == 0

      has_next = values.size > index + @h
      if greater?(values[index], values[index + @h]) and has_next
        values = exchange(values, index, index + @h)
        sort_back(values, index, prev_(index))
      end

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

    def calcule_h(array_size, value)
      return value if (array_size / 3) < value
      calcule_h(array_size, (value * 3) + 1)
    end
    def half(value); value / 2; end
    def prev_(pointer); pointer - @h; end
    def next_(pointer); pointer + 1; end
  end
end
