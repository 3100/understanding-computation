require_relative 'spec_helper'

describe Sequence, "#evaluate" do
  it "enable to evaluate two statements" do
    res = Sequence.new(
      Assign.new(:x, Add.new(Number.new(1), Number.new(1))),
      Assign.new(:y, Add.new(Variable.new(:x), Number.new(3)))
    ).evaluate({})
    res[:x].should eq(Number.new(2))
    res[:y].should eq(Number.new(5))
  end
end
