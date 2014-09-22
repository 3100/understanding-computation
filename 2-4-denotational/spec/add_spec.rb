require_relative 'spec_helper'

describe Add, "#to_ruby" do
  it "returns 4 for 'x + 1' when x = 3" do
    proc = eval(Add.new(Variable.new(:x), Number.new(1)).to_ruby)
    expect(proc.call({ x: 3})).to eq(4)
  end
end
