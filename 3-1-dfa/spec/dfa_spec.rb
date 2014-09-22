require_relative 'spec_helper'

describe DFA, "#accepting?" do
  it "returns false for 'b'" do
    dfa = DFA.new(1, [3], @rulebook)
    dfa.read_character('b')
    dfa.accepting?.should be_false
  end

  it "returns true for 'baaab'" do
    dfa = DFA.new(1, [3], @rulebook)
    dfa.read_string('baaab')
    dfa.accepting?.should be_true
  end
end
