##
# Helper for nil values

module Comparator
  ##
  # Compare first value with other to verfy if it is greater than

  def greater?(value, other)
    (nil_value(value) <=> nil_value(other)) == 1
  end

  def lesser?(value, other)
    (nil_value(value) <=> nil_value(other)) == -1
  end

  private
  def nil_value(value)
    return 0 if value.nil?
    value
  end
end
