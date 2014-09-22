require_relative 'spec_helper'

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
    expect(machine.environment[:y]).to eq(Number.new(1))
  end

  it "should do nothing if condition is false" do
    machine = Machine.new(
      If.new(Variable.new(:x), Assign.new(:y, Number.new(1)), DoNothing.new),
      { x: Boolean.new(false) }
    )
    machine.run
    expect(machine.environment[:y]).to be_nil
  end
end
