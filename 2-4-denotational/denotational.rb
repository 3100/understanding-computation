class Number < Struct.new(:value)
  def evaluate(environment)
    self
  end

  def inspect
    "<<#{self}>>"
  end

  def to_ruby
    " -> e { #{value.inspect} }"
  end

  def to_s
    value.to_s
  end
end

class Add < Struct.new(:left, :right)
  def evaluate(environment)
    Number.new(left.evaluate(environment).value + right.evaluate(environment).value)
  end

  def inspect
    "<<#{self}>>"
  end

  def to_ruby
    "-> e { (#{left.to_ruby}).call(e) + (#{right.to_ruby}).call(e) }"
  end

  def to_s
    "#{left} + #{right}"
  end
end

class Multiply < Struct.new(:left, :right)
  def evaluate(environment)
    Number.new(left.evaluate(environment).value * right.evaluate(environment).value)
  end

  def inspect
    "<<#{self}>>"
  end

  def to_ruby
    "-> e { (#{left.to_ruby}).call(e) * (#{right.to_ruby}).call(e) }"
  end

  def to_s
    "#{left} * #{right}"
  end
end

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

class LessThan < Struct.new(:left, :right)
  def evaluate(environment)
    Boolean.new(left.evaluate(environment).value < right.evaluate(environment).value)
  end

  def inspect
    "<<#{self}>>"
  end

  def to_ruby
    "-> e { (#{left.to_ruby}).call(e) < (#{right.to_ruby}).call(e) }"
  end

  def to_s
    "#{left} < #{right}"
  end
end

class Variable < Struct.new(:name)
  def evaluate(environment)
    environment[name]
  end

  def inspect
    "<<#{self}>>"
  end

  def to_ruby
    "-> e { e[#{name.inspect}] }"
  end

  def to_s
    name.to_s
  end
end

class DoNothing
  def evaluate(environment)
    environment
  end

  def to_ruby
    '-> e { e }'
  end

  def to_s
    'do-nothing'
  end

  def ==(other_statement)
    other_statement.instance_of?(DoNothing)
  end
end

class Assign < Struct.new(:name, :expression)
  def evaluate(environment)
    environment.merge({name => expression.evaluate(environment)})
  end

  def inspect
    "<<#{self}>>"
  end

  def to_ruby
    "-> e { e.merge({ #{name.inspect} => (#{expression.to_ruby}).call(e) }) }"
  end

  def to_s
    "#{name} = #{expression}"
  end
end

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

  def to_ruby
    "-> e { if (#{condition.to_ruby}).call(e)" +
      " then (#{consequence.to_ruby}).call(e)" +
      " else (#{alternative.to_ruby}).call(e)" +
      " end }"
  end

  def to_s
    "if (#{condition}) { #{consequence} } else { #{alternative} }"
  end
end

class Sequence < Struct.new(:first, :second)
  def evaluate(environment)
    second.evaluate(first.evaluate(environment))
  end

  def inspect
    "<<#{self}>>"
  end

  def to_ruby
    "-> e { (#{second.to_ruby}).call((#{first.to_ruby}).call(e)) }"
  end

  def to_s
    "#{first}; #{second}"
  end
end

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

  def to_ruby
    "-> e {" +
      " while (#{condition.to_ruby}).call(e); e = (#{body.to_ruby}).call(e); end;" +
      " e" +
      " }"
  end

  def to_s
    "while (#{condition}) { #{body} }"
  end
end
