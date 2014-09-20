class Boolean < Struct.new(:value)
  def evaluate(environment)
    self
  end

  def inspect
    "<<#{self}>>"
  end

  def to_ruby
    "-> e { #{value.inspect} }"
  end

  def to_s
    value.to_s
  end
end
