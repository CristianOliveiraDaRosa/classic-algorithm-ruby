##
# Implementation of sort using {https://pt.wikipedia.org/wiki/Selection_sort} algorithm

module Selection
  class Sort
    def sort(values)
      _sort(values, 0)
    end

    def _sort(values, icurrent)
      return values if invalid?(values) or values.size == icurrent

      indext_lesser = find_lesser(values, icurrent, next_(icurrent))
      values = exchange(values, icurrent, indext_lesser)

      _sort(values, next_(icurrent))
    end

    private
    def find_lesser(values, lesser, current)
      return lesser if values.size == current
      lesser = current if greater?(values[lesser], values[current])
      find_lesser(values, lesser, next_(current))
    end

    def greater?(current, compared)
      (nill_value(current) <=> nill_value(compared)) == 1
    end

    def exchange(values, current, min)
      current_value = values[current]
      values[current] = values[min]
      values[min] = current_value
      values
    end

    def invalid?(values)
      values.nil? || values.empty? || values.one?
    end

    def next_(pointer)
      pointer + 1
    end

    def nill_value(value)
      return 0 if value.nil?
      value
    end
  end
end
