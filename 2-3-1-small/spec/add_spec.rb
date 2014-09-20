require 'spec_helper'

describe Add, "#new" do
  it "should enable to add two values" do
    machine = Machine.new(
      Add.new(
        Multiply.new(Number.new(1), Number.new(2)),
        Multiply.new(Number.new(3), Number.new(4))
      )
    )
    machine.run
    machine.statement.should eq(Number.new(14))
  end
end
