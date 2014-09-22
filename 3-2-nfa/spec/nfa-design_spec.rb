require_relative 'spec_helper'

describe NFADesign, "#accepts?" do
  before :all do
    rulebook = NFARulebook.new([
                                FARule.new(1, nil, 2), FARule.new(1, nil, 4),
                                FARule.new(2, 'a', 3),
                                FARule.new(3, 'a', 2),
                                FARule.new(4, 'a', 5),
                                FARule.new(5, 'a', 6),
                                FARule.new(6, 'a', 4)
    ])
    @nfa_design = NFADesign.new(1, [2, 4], rulebook)
  end

  it "returns true for 'aa'" do
    @nfa_design.accepts?('aa').should be_true
  end

  it "returns true for 'aaa'" do
    @nfa_design.accepts?('aaa').should be_true
  end

  it "returns false for 'aaaaa'" do
    @nfa_design.accepts?('aaaaa').should be_false
  end

  it "returns true for 'aaaaaa'" do
    @nfa_design.accepts?('aaaaaa').should be_true
  end
end
