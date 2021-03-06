require_relative 'spec_helper'

describe LessThan, "#to_ruby" do
  it "returns false for 'x + 1 < 3' when x = 3" do
    proc = eval(LessThan.new(Add.new(Variable.new(:x), Number.new(1)),
                             Number.new(3)).to_ruby)
    expect(proc.call({ x:3 })).to be false
  end
end
