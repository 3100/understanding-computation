require_relative 'spec_helper'

describe Repeat, "#new" do
  it "returns correct patterns" do
    pattern = Repeat.new(
      Choose.new(
        Concatenate.new(Literal.new('a'), Literal.new('b')),
        Literal.new('a')
      )
    )
    expect(pattern.inspect).to eq("/(ab|a)*/")
  end
end
