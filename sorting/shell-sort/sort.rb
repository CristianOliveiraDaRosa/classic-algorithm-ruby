require_relative '../shared/validator'
require_relative '../shared/exchanger'
require_relative '../shared/comparator'

##
# Implementation of sort using {https://pt.wikipedia.org/wiki/Insertion_sort} algorithm

module Shell
  class Sort
    def initialize
      @exchanger = Exchanger.new
      @comparator = Comparator.new
    end

    def sort(values)
      return values if Validator.invalid?(values)
      @h = values.size / 2
      _sort(values, 0)
    end

    private
    def _sort(values, index)
      if values.size <= index
        @h = @h / 2
        index = 0
      end
      return values if @h == 0

      has_next = values.size > index + @h
      if @comparator.this(values[index]).greater_than?(values[index + @h]) and has_next
        values = @exchanger.exchange(values, index, index + @h)
        sort_back(values, index, prev_(index))
      end

      _sort(values, next_(index))
    end

    def sort_back(values, lowest, previus)
      return values if previus < 0

      if @comparator.this(values[previus]).greater_than?(values[lowest])
        values = @exchanger.exchange(values, previus, lowest)
        lowest = previus
      end

      sort_back(values, lowest, prev_(previus))
    end

    def prev_(pointer); pointer - @h; end
    def next_(pointer); pointer + 1; end
  end
end
