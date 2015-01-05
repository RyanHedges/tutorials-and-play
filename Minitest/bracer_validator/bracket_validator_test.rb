require "minitest/autorun"
require_relative "bracket_validator"

describe "Integration type tests" do
  it "returns true with a valid bracket pair" do
    validator = BracketValidator.new("[]")
    validator.validate
    validator.must_be :valid?
  end

  it "returns true with a complicated valid bracket pair" do
    validator = BracketValidator.new("[{[]()()}{[]}]")
    validator.validate
    validator.must_be :valid?
  end

  it "returns false with a invalid bracket pair" do
    validator = BracketValidator.new("[)")
    validator.validate
    validator.wont_be :valid?
  end

  it "returns false with a complicated valid bracket pair" do
    validator = BracketValidator.new("[({}){([{}])}]{[()]}{{{()}}(}")
    validator.validate
    validator.wont_be :valid?
  end
end

describe BracketValidator do
  describe "#initialize" do
    it "stores the bracket code" do
      validator = BracketValidator.new("[]")
      validator.instance_variable_get(:@code_string).must_equal "[]"
    end
  end

  describe ".valid?" do
    it "returns true when the code string is valid" do
      validator = BracketValidator.new("[]")
      validator.validate
      validator.valid?.must_equal true
    end

    it "returns false when the code string is invalid" do
      validator = BracketValidator.new("[)")
      validator.validate
      validator.valid?.must_equal false
    end
  end

  describe ".validate" do
    it "sets the valid status to true" do
      validator = BracketValidator.new("[]")
      validator.validate
      validator.instance_variable_get(:@valid_status).must_equal true
    end

    it "splits up the code_string" do
      code_string_mock = MiniTest::Mock.new
      validator = BracketValidator.new(code_string_mock)
      code_string_mock.expect(:chars, ["(", ")"])
      validator.validate
      code_string_mock.verify
    end
  end

  describe ".verify_collection" do
    it "returns true if all pairs are valid" do
      validator = BracketValidator.new("")
      validator.verify_collection(["(", "{", "}", ")"]).must_equal true
    end
  end
end


describe Bracket do
  describe "initialize" do
    it "saves the opener or closer" do
      bracket = Bracket.new("[")
      bracket.instance_variable_get(:@bracket).must_equal "["
    end
  end

  describe "opener?" do
    describe "when the bracket is '['" do
      it "returns true" do
        bracket = Bracket.new("{")
        bracket.opener?.must_equal true
      end
    end

    describe "when the bracket is '('" do
      it "returns true" do
        bracket = Bracket.new("(")
        bracket.opener?.must_equal true
      end
    end

    describe "when the bracket is '{'" do
      it "returns true" do
        bracket = Bracket.new("{")
        bracket.opener?.must_equal true
      end
    end

    describe "when the bracket is an invalid opener" do
      it "returns false" do
        bracket = Bracket.new("]")
        bracket.opener?.must_equal false
      end
    end
  end

  describe "closer?" do
    describe "when the bracket is ')'" do
      it "returns true" do
        bracket = Bracket.new(")")
        bracket.closer?.must_equal true
      end
    end

    describe "when the bracket is ']'" do
      it "returns true" do
        bracket = Bracket.new("]")
        bracket.closer?.must_equal true
      end
    end

    describe "when the bracket is '}'" do
      it "returns true" do
        bracket = Bracket.new("}")
        bracket.closer?.must_equal true
      end
    end

    describe "when the bracet is an invalid closer" do
      it "returns false" do
        bracket = Bracket.new("[")
        bracket.closer?.must_equal false
      end
    end
  end

  describe "code" do
    it "returns the ascii character code for the bracket" do
      bracket = Bracket.new("[")
      bracket.code.must_equal 91
    end

    it "returns the code for '}'" do
      bracket = Bracket.new("}")
      bracket.code.must_equal 125
    end
  end
end

describe Pair do
  describe "initalize" do
    it "stores the opener bracket object" do
      opening_bracket = Bracket.new("[")
      pair = Pair.new(opening_bracket)
      pair.instance_variable_get(:@opening_bracket).must_be_instance_of Bracket
    end
  end

  describe "closer_for_opener?" do
    describe "when the bracket matches the pairs opener" do
      it "returns true" do
        opening_bracket = Bracket.new("[")
        valid_closing_bracket = Bracket.new("]")
        pair = Pair.new(opening_bracket)
        pair.closer_for_opener?(valid_closing_bracket).must_equal true
      end
    end

    describe "when the bracket does not match the pairs opener" do
      it "returns false" do
        opening_bracket = Bracket.new("{")
        invalid_closing_bracket = Bracket.new(")")
        pair = Pair.new(opening_bracket)
        pair.closer_for_opener?(invalid_closing_bracket).must_equal false
      end
    end
  end

  describe "needed_closer_code" do
    describe "when it is '['" do
      it "returns the closing code that matches the opener" do
        opening_bracket = Bracket.new("[")
        pair = Pair.new(opening_bracket)
        pair.needed_closer_code.must_equal 93
      end
    end

    describe "when it is '('" do
      it "returns the closing code that matcher the opener" do
        opening_bracket = Bracket.new("(")
        pair = Pair.new(opening_bracket)
        pair.needed_closer_code.must_equal 41
      end
    end

    describe "when it is '{'" do
      it "returns the closing code that matcher the opener" do
        opening_bracket = Bracket.new("{")
        pair = Pair.new(opening_bracket)
        pair.needed_closer_code.must_equal 125
      end
    end
  end
end
