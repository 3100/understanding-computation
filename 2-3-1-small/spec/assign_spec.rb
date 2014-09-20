require 'spec_helper'

describe Assign, "#new" do
  it "enable to assign a new value to variable :x" do
    machine = Machine.new(
      Assign.new(:x, Add.new(Variable.new(:x), Number.new(1))),
      { x: Number.new(2) }
    )
    machine.run
    machine.environment[:x].should eq(Number.new(3))
  end
end
