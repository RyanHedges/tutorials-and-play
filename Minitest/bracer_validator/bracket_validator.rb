class BracketValidator
  def initialize(code_string)
    @code_string = code_string
  end

  def valid?
    true
  end

  def validate
    split_code_string = @code_string.chars
    verify_collection(split_code_string)
    @valid_status = true
  end

  def verify_collection(code_collection)
    opener_stack = Array.new
    code_collection.each do |opener_or_closer|

    end
  end
end

class Bracket

end
