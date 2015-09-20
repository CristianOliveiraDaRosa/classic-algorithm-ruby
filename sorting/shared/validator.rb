class Validator
  def self.invalid?(values)
    values.nil? || values.empty? || values.one?
  end
end
