class QuickFind
  attr_reader :elements

  def initialize(ary_lenght)
    @elements = []
    for i in ary_lenght.times
      @elements[i] = i
    end
  end

  def union(number_one, number_two)
    return self if connected?(number_one, number_two)

    change(@elements.size, @elements[number_one], @elements[number_two])
  end

  def connected?(number_one, number_two)
    @elements[number_one] == @elements[number_two]
  end

  private
  def change(i, first, second)
    return self if i < 0

    @elements[i] = second if @elements[i] == first

    change(i-1, first, second)
  end

end
