class Add < Struct.new(:left, :right)
  def inspect
    "<<#{self}>>"
  end

  def reduce(environment)
    if left.reducible?
      Add.new(left.reduce(environment), right)
    elsif right.reducible?
      Add.new(left, right.reduce(environment))
    else
      Number.new(left.value + right.value)
    end
  end

  def reducible?
    true
  end

  def to_s
    "#{left} + #{right}"
  end
end
