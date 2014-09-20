class Sequence < Struct.new(:first, :second)
  def evaluate(environment)
    second.evaluate(first.evaluate(environment))
  end

  def inspect
    "<<#{self}>>"
  end

  def to_s
    "#{first}; #{second}"
  end
end
