class QuickFind
  attr_reader :elements

  def initialize(elements_lenght)
    @elements = elements_lenght.times.map{|i| i }
  end

  def union(element, target)
    return self if connected?(element, target)

    connect(@elements.size, @elements[element], @elements[target])
  end

  def connected?(number, target)
    @elements[number] == @elements[target]
  end

  private
  def connect(i, first, second)
    @elements[i] = second if @elements[i] == first

    return self if i == 0
    connect(next_(i), first, second)
  end

  def next_(i)
    i - 1
  end
end
