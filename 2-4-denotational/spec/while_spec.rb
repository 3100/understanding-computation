require_relative 'spec_helper'

describe While, "to_ruby" do
  it "returns 9 for 'while x < 5 { x = x * 3 }' when x = 1" do
    statement = While.new(
      LessThan.new(Variable.new(:x), Number.new(5)),
      Assign.new(:x, Multiply.new(Variable.new(:x), Number.new(3)))
    )
    res = eval(statement.to_ruby).call({ x: 1 })
    res[:x].should eq(9)
  end
end
