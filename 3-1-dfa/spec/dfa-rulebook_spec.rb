require_relative 'spec_helper'

describe DFARulebook, "next_state" do
  it "returns 2 for 'a' at state 1" do
    @rulebook.next_state(1, 'a').should eq(2)
  end

  it "returns 1 for 'b' at state 1" do
    @rulebook.next_state(1, 'b').should eq(1)
  end

  it "returns 3 for 'b' at state 2" do
    @rulebook.next_state(2, 'b').should eq(3)
  end
end
