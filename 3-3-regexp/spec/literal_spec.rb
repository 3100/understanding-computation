require_relative 'spec_helper'

describe Literal, "#matches?" do
  it "returns true for 'a' when its value is 'a'" do
    expect(Literal.new('a').matches?('a')).to be true
  end
end
