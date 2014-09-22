require_relative 'spec_helper'

describe Sequence, "#new" do
  it "enable to compute two Assign statements" do
    machine = Machine.new(
      Sequence.new(
        Assign.new(:x, Add.new(Number.new(1), Number.new(1))),
        Assign.new(:y, Add.new(Variable.new(:x), Number.new(3)))
      ), {}
    )
    machine.run
    expect(machine.environment[:x]).to eq(Number.new(2))
    expect(machine.environment[:y]).to eq(Number.new(5))
  end
end
