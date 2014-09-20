require_relative './dfa-design'
require_relative './dfa-rulebook'
require_relative './fa-rule'

class DFA < Struct.new(:current_state, :accept_states, :rulebook)
  def accepting?
    accept_states.include?(current_state)
  end

  def read_character(character)
    self.current_state = rulebook.next_state(current_state, character)
  end

  def read_string(string)
    string.chars.each do |character|
      read_character(character)
    end
  end
end
