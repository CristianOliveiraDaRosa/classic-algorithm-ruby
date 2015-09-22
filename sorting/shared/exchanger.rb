module Exchanger
  ##
  # Exchange +values+ from an array between +current+ index and +other+ index
  # @param values [Array]
  # @param current [Integer] index of current
  # @param other [Integer] index to be changed

  def exchange(values, current, other)
    current_value = values[current]
    values[current] = values[other]
    values[other] = current_value
    return(values)
  end
end
