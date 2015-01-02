require "minitest/autorun"
require_relative "bracer_validator"

describe BracerValidator do
  describe "integration/big picture tests" do
    it "returns true when the bracers are valid" do
      bracer_validator = BracerValidator.new
      bracer_validator.validate("{}").must_equal true
    end

    it "returns false when the bracers are invalid" do
      bracer_validator = BracerValidator.new
      bracer_validator.validate("[}").must_equal false
    end
  end
end
