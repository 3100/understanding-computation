require_relative 'spec_helper'

describe Multiply, "#new" do
  it "should enable to multiply two values" do
    machine = Machine.new(
      Multiply.new(Number.new(3), Number.new(4))
    )
    machine.run
    expect(machine.statement).to eq(Number.new(12))
  end
end
