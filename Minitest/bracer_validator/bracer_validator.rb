class BracerValidator
  def validate(code_string)
    if code_string == "{}"
      return true
    else
      return false
    end
  end
end
