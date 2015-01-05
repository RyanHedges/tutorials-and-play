require "minitest/autorun"
require_relative "bracer_validator"

describe "Integration type tests" do
  it "returns true with a valid bracer pair" do
    validator = BracerValidator.new("[]")
    validator.validate
    validator.must_be :valid?
  end
end

describe BracerValidator do
  describe "#initialize" do
    it "stores the bracer code" do
      validator = BracerValidator.new("[]")
      validator.instance_variable_get(:@code_string).must_equal "[]"
    end
  end

  describe ".valid?" do
    it "returns true when the code string is valid" do
      validator = BracerValidator.new("[]")
      validator.valid?.must_equal true
    end

    it "returns false when the code string is invalid" do
      skip("not implemented yet")
      validator = BracerValidator.new("[)")
      validator.valid?.must_equal false
    end
  end

  describe ".validate" do
    it "sets the valid status to true" do
      validator = BracerValidator.new("[]")
      validator.validate
      validator.instance_variable_get(:@valid_status).must_equal true
    end

    it "splits up the code_string" do
      mock = MiniTest::Mock.new
      validator = BracerValidator.new("[]")
      validator.instance_variable_set(:@code_string, mock)
      mock.expect(:chars, ["[", "]"])
      validator.validate
      mock.verify
    end
  end
end
