require_relative 'spec_helper'

describe Variable, "#new" do
  it "should calculate 'x + y = 7' when x = 3 and y = 4" do
    machine = Machine.new(
      Add.new(
        Variable.new(:x),
        Variable.new(:z)),
      { x: Number.new(3), z: Number.new(4) }
    )
    machine.run
    machine.environment[:x].should eq(Number.new(3))
    machine.environment[:z].should eq(Number.new(4))
    machine.statement.should eq(Number.new(7))
  end
end
