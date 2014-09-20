class Variable < Struct.new(:name)
  def inspect
    "<<#{self}>>"
  end

  def reduce(environment)
    environment[name]
  end

  def reducible?
    true
  end

  def to_s
    name.to_s
  end
end
