##
# Implementation of sort using {https://pt.wikipedia.org/wiki/Selection_sort} algorithm

module Selection
  class Sort
    def sort(values)
      @count = 0
      _sort(values, 0, 1)
    end

    private
    def _sort(values, current, compared)
      @count += 1
      p "values #{values} current #{current}, compared #{compared} count #{@count}"
      return values if invalid?(values) or finished?(values.size, current, compared)

      values = exchange(values, current, compared) if greater?(values[current], values[compared])

      values = _sort(values, current, next_(compared))
      _sort(values, next_(current), compared)
    end

    def greater?(current, compared)
      (current <=> compared) == 1
    end

    def exchange(values, current, compared)
      current_value = values[current]
      values[current] = values[compared]
      values[compared] = current_value
      values
    end

    def invalid?(values)
      values.nil? || values.empty? || values.one?
    end

    def finished?(size, current, compared)
      size == compared or current == compared
    end

    def next_(pointer)
      pointer + 1
    end
  end
end
