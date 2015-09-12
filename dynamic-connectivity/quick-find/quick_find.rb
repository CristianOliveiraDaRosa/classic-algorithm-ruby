class QuickFind
  attr_reader :id

  def initialize(ary_lenght)
    @id = []
    for i in ary_lenght.times
      @id[i] = i
    end
  end

  def union(number_one, number_two)
    return self if connected?(number_one, number_two)

    change(@id.size, @id[number_one], @id[number_two])
  end

  def connected?(number_one, number_two)
    @id[number_one] == @id[number_two]
  end

  private
  def change(i, first, second)
    return self if i < 0

    @id[i] = second if @id[i] == first

    change(i-1, first, second)
  end

end
