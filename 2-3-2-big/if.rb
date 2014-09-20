class If < Struct.new(:condition, :consequence, :alternative)
  def evaluate(environment)
    case condition.evaluate(environment)
    when Boolean.new(true)
      consequence.evaluate(environment)
    else
      alternative.evaluate(environment)
    end
  end

  def inspect
    "<<#{self}>>"
  end

  def to_s
    "if (#{condition}) { #{consequence} } else { #{alternative} }"
  end
end
