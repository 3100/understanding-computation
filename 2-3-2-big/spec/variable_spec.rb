require_relative 'spec_helper'

describe Variable, "#evaluate" do
  it "returns a correct value" do
    Variable.new(:x).evaluate({ x: Number.new(23) }).should eq(Number.new(23))
  end
end
