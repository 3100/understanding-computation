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
    expect(machine.environment[:x]).to eq(Number.new(3))
    expect(machine.environment[:z]).to eq(Number.new(4))
    expect(machine.statement).to eq(Number.new(7))
  end
end
