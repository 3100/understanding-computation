require 'spec_helper'

describe If, "#new" do
  it "should works as a condition statement" do
    machine = Machine.new(
      If.new(
        Variable.new(:x),
        Assign.new(:y, Number.new(1)),
        Assign.new(:y, Number.new(2))
      ),
      { x: Boolean.new(true) }
    )
    machine.run
    machine.environment[:y].should eq(Number.new(1))
  end

  it "should do nothing if condition is false" do
    machine = Machine.new(
      If.new(Variable.new(:x), Assign.new(:y, Number.new(1)), DoNothing.new),
      { x: Boolean.new(false) }
    )
    machine.run
    machine.environment[:y].should be_nil
  end
end
