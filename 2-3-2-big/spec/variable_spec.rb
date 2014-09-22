require_relative 'spec_helper'

describe Variable, "#evaluate" do
  it "returns a correct value" do
    res = Variable.new(:x).evaluate({ x: Number.new(23) })
    expect(res).to eq(Number.new(23))
  end
end
