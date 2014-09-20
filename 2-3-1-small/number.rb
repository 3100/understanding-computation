class Number < Struct.new(:value)
  def inspect
    "<<#{self}>>"
  end

  def reducible?
    false
  end

  def to_s
    value.to_s
  end
end
