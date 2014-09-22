require_relative 'spec_helper'

describe DFARulebook, "next_state" do
  it "returns 2 for 'a' at state 1" do
    expect(@rulebook.next_state(1, 'a')).to eq(2)
  end

  it "returns 1 for 'b' at state 1" do
    expect(@rulebook.next_state(1, 'b')).to eq(1)
  end

  it "returns 3 for 'b' at state 2" do
    expect(@rulebook.next_state(2, 'b')).to eq(3)
  end
end
