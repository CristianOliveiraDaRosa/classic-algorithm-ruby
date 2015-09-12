class QuickFind
  attr_reader :elements

  def initialize(elements_lenght)
    @elements = []
    elements_lenght.times do |i|
      @elements[i] = i
    end
  end

  def union(number_one, number_two)
    return self if connected?(number_one, number_two)

    connect(@elements.size, @elements[number_one], @elements[number_two])
  end

  def connected?(number_one, number_two)
    @elements[number_one] == @elements[number_two]
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
