require 'spec_helper'

describe While, "#evaluate" do
  it "returns 9 for 'while (x < 5) { x = x * 3 }' when x = 1" do
    statement = While.new(
      LessThan.new(Variable.new(:x), Number.new(5)),
      Assign.new(:x, Multiply.new(Variable.new(:x), Number.new(3)))
    )
    statement.evaluate({ x: Number.new(1) })[:x].should eq(Number.new(9))
  end
end
