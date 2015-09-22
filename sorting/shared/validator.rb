module Validator
  ##
  # Validate if a array is valid for sort.
  # @param values Any value to be validated
   
  def invalid_to_sort?(values)
    values.nil? || values.empty? || values.one?
  end
end
