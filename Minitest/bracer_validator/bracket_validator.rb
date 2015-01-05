class BracketValidator
  def initialize(code_string)
    @code_string = code_string
  end

  def valid?
    @valid_status
  end

  def validate
    split_code_string = @code_string.chars
    @valid_status = verify_collection(split_code_string)
  end

  def verify_collection(code_collection)
    pair_stack = Array.new
    code_collection.each do |brack|
      bracket = Bracket.new(brack)
      if bracket.opener?
        pair_stack << Pair.new(bracket)
      else
        opener_pair = pair_stack.pop
        if opener_pair.closer_for_opener?(bracket)
        else
          pair_stack.push(opener_pair)
          return false
        end
      end
    end
    return true
  end
end

class Bracket
  def initialize(bracket)
    @bracket = bracket
  end

  def opener?
    case @bracket
    when "[", "(", "{"
      return true
    else
      return false
    end
  end

  def closer?
    case @bracket
    when "]", ")", "}"
      return true
    else
      return false
    end
  end

  def code
    @bracket.ord
  end
end

class Pair
  def initialize(bracket)
    @opening_bracket = bracket
  end

  def closer_for_opener?(closer_bracket)
    needed_closer_code == closer_bracket.code ? true : false
  end

  def needed_closer_code
    case @opening_bracket.code
    when 91
      return 93
    when 40
      return 41
    when 123
      return 125
    end
  end
end
