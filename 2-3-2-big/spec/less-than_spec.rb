require_relative 'spec_helper'

describe LessThan, "#evaluate" do
  it "returns a correct value" do
    res = LessThan.new(
      Add.new(Variable.new(:x), Number.new(2)),
      Variable.new(:y)
    ).evaluate({ x: Number.new(2), y: Number.new(5) })
    expect(res).to eq(Boolean.new(true))
  end
end
