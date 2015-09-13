module Balanced
  class QuickUnion
    attr_reader :elements

    def initialize(elements_lenght)
      @elements = elements_lenght.times.map{|i| i}
      @tree_size = Hash.new
    end

    def union(number, target)
      child, parent = smallest(root(number), root(target))
      return connect(child, parent)
    end

    def connected?(number, target)
      return @elements[number] == target if root?(number)
      connected?(@elements[number], target)
    end

    private
    def smallest(root, root_target)
      return root, root_target if (@tree_size[root] || 0) <= (@tree_size[root_target] || 0)
      return root_target, root
    end

    def root(element)
      return element if root?(element)
      root(@elements[element])
    end

    def root?(element)
      @elements[element] == element
    end

    def connect(child, parent)
      @elements[child] = parent
      @tree_size[parent] = 0 unless @tree_size[parent]
      @tree_size[parent] += 1
      return self
    end
  end
end
