class Exchanger
  def exchange(values, current, other)
    current_value = values[current]
    values[current] = values[other]
    values[other] = current_value
    values
  end
end
