require_relative 'spec_helper'

describe DFA, "#accepting?" do
  it "returns false for 'b'" do
    dfa = DFA.new(1, [3], @rulebook)
    dfa.read_character('b')
    expect(dfa.accepting?).to be false
  end

  it "returns true for 'baaab'" do
    dfa = DFA.new(1, [3], @rulebook)
    dfa.read_string('baaab')
    expect(dfa.accepting?).to be true
  end
end
