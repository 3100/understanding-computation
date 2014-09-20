require 'spec_helper'

describe Sequence, "#new" do
  it "enable to compute two Assign statements" do
    machine = Machine.new(
      Sequence.new(
        Assign.new(:x, Add.new(Number.new(1), Number.new(1))),
        Assign.new(:y, Add.new(Variable.new(:x), Number.new(3)))
      ), {}
    )
    machine.run
    machine.environment[:x].should eq(Number.new(2))
    machine.environment[:y].should eq(Number.new(5))
  end
end
