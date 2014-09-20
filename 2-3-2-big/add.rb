class Add < Struct.new(:left, :right)
  def evaluate(environment)
    Number.new(left.evaluate(environment).value + right.evaluate(environment).value)
  end

  def inspect
    "<<#{self}>>"
  end

  def to_s
    "#{left} + #{right}"
  end
end
