class Comparator

  def this(value)
    @value = value
    return self
  end

  def greater_than?(other)
    (nil_value(@value) <=> nil_value(other)) == 1
  end

  def lesser_than?(other)
    (nil_value(@value) <=> nil_value(other)) == -1
  end

  private
  def nil_value(value)
    return 0 if value.nil?
    value
  end
end
