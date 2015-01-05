require "minitest/autorun"
require_relative "bracer_validator"

describe "Integration type tests" do
  it "returns true with a valid bracer pair" do
    validator = BracerValidator.new("[]")
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

  describe "#valid?" do
    it "returns true when the code string is valid" do
      validator = BracerValidator.new("[]")
      validator.valid?.must_equal true
    end
  end
end
