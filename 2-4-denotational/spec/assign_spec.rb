require_relative 'spec_helper'

describe Assign, "to_ruby" do
  it "assigns 4 to :y for 'y = x + 1' when x = 3" do
    statement = Assign.new(:y, Add.new(Variable.new(:x), Number.new(1)))
    res = eval(statement.to_ruby).call({ x: 3 })
    res[:y].should eq(4)
  end
end
