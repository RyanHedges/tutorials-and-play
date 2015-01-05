require "minitest/autorun"
require_relative "bracket_validator"

describe "Integration type tests" do
  it "returns true with a valid bracket pair" do
    validator = BracketValidator.new("[]")
    validator.validate
    validator.must_be :valid?
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
      validator.valid?.must_equal true
    end

    it "returns false when the code string is invalid" do
      skip("not implemented yet")
      validator = BracketValidator.new("[)")
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
end
