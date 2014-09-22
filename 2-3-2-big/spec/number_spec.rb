require_relative 'spec_helper'

describe Number, "#evaluate" do
  it "returns a correct value" do
    expect(Number.new(23).evaluate({})).to eq(Number.new(23))
  end
end
