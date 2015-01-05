class BracerValidator
  def initialize(code_string)
    @code_string = code_string
  end

  def valid?
    true
  end

  def validate
    split_code_string = @code_string.chars
    @valid_status = true
  end
end
