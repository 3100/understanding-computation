class While < Struct.new(:condition, :body)
  def evaluate(environment)
    case condition.evaluate(environment)
    when Boolean.new(true)
      evaluate(body.evaluate(environment))
    when Boolean.new(false)
      environment
    end
  end

  def inspect
    "<<#{self}>>"
  end

  def to_s
    "while (#{condition}) { #{body} }"
  end
end
