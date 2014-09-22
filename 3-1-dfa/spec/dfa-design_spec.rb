require_relative 'spec_helper'

describe DFADesign, "#accepts?" do
  before :all do
    @dfa_design = DFADesign.new(1, [3], @rulebook)
  end

  it "returns false for 'a'" do
    expect(@dfa_design.accepts?('a')).to be false
  end

  it "returns false for 'baa'" do
    expect(@dfa_design.accepts?('baa')).to be false
  end

  it "returns false for 'baba'" do
    expect(@dfa_design.accepts?('baba')).to be true
  end
end
