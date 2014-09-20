require 'spec_helper'

describe DFADesign, "#accepts?" do
  before :all do
    @dfa_design = DFADesign.new(1, [3], @rulebook)
  end

  it "returns false for 'a'" do
    @dfa_design.accepts?('a').should be_false
  end

  it "returns false for 'baa'" do
    @dfa_design.accepts?('baa').should be_false
  end

  it "returns false for 'baba'" do
    @dfa_design.accepts?('baba').should be_true
  end
end
