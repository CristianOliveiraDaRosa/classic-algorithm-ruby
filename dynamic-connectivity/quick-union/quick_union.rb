class QuickUnion
  attr_reader :elements

  def initialize(elements_lenght)
    @elements = elements_lenght.times.map{|i| i}
  end

  def union(number, target)
    @elements[root(number)] = root(target)
    return self
  end

  def connected?(number, target)
    return @elements[number] == target if root?(number)
    connected?(@elements[number], target)
  end

  private
  def root(element)
    return element if root?(element)
    root(@elements[element])
  end

  def root?(element)
    @elements[element] == element
  end
end
