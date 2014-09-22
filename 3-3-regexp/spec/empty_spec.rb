require_relative 'spec_helper'

describe Empty, "#matches?" do
  it "returns false for 'a'" do
    expect(Empty.new.matches?('a')).to be false
  end
end
