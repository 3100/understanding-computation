class Variable < Struct.new(:name)
  def evaluate(environment)
    environment[name]
  end

  def inspect
    "<<#{self}>>"
  end

  def to_s
    name.to_s
  end
end
