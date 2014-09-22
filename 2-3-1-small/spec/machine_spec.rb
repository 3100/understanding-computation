require_relative 'spec_helper'

describe Machine, "#run" do
  it "returns 9 for 'while x < 5; x = x * 3; end' when x = 1" do
    env = { x: Number.new(1) }
    machine = Machine.new(
      While.new(
        LessThan.new(Variable.new(:x), Number.new(5)),
        Assign.new(:x, Multiply.new(Variable.new(:x), Number.new(3)))
      ), env
    )
    machine.run
    expect(machine.statement).to eq(DoNothing.new)
    expect(machine.environment[:x]).to eq(Number.new(9))
  end
end
