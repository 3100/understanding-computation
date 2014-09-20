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

class Multiply < Struct.new(:left, :right)
  def inspect
    "<<#{self}>>"
  end

  def reduce(environment)
    if left.reducible?
      Add.new(left.reduce(environment), right)
    elsif right.reducible?
      Add.new(left, right.reduce(environment))
    else
      Number.new(left.value * right.value)
    end
  end

  def reducible?
    true
  end

  def to_s
    "#{left} * #{right}"
  end
end

class Boolean < Struct.new(:value)
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

class LessThan < Struct.new(:left, :right)
  def inspect
    "<<#{self}>>"
  end

  def reduce(environment)
    if left.reducible?
      LessThan.new(left.reduce(environment), right)
    elsif right.reducible?
      LessThan.new(left, right.reduce(environment))
    else
      Boolean.new(left.value < right.value)
    end
  end

  def redurible?
    true
  end

  def to_s
    "#{left} < #{right}"
  end
end

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

class DoNothing
  def reducible?
    false
  end

  def to_s
    'do-nothing'
  end

  def ==(other_statement)
    other_statement.instance_of?(DoNothing)
  end
end

class Assign < Struct.new(:name, :expression)
  def inspect
    "<<#{self}>>"
  end

  def reduce(environment)
    if expression.reducible?
      [Assign.new(name, expression.reduce(environment)), environment]
    else
      [DoNothing.new, environment.merge({name => expression})]
    end
  end

  def reducible?
    true
  end

  def to_s
    "#{name} = #{expression}"
  end
end

class If < Struct.new(:condition, :consequence, :alternative)
  def inspect
    "<<#{self}>>"
  end

  def reduce(environment)
    if condition.reducible?
      [If.new(condition.reduce(environment), consequence, alternative), environment]
    else
      case condition
      when Boolean.new(true)
        [consequence, environment]
      when Boolean.new(false)
        [alternative, environment]
      end
    end
  end

  def reducible?
    true
  end

  def to_s
    "if (#{condition}) { #{consequence} } else { #{alternative} }"
  end
end

class Sequence < Struct.new(:first, :second)
  def inspect
    "<<#{self}>>"
  end

  def reducible?
    true
  end

  def reduce(environment)
    case first
    when DoNothing.new
      [second, environment]
    else
      reduced_first, reduced_environment = first.reduce(environment)
      [Sequence.new(reduced_first, second), reduced_environment]
    end
  end

  def to_s
    "#{first}; #{second}"
  end
end

class While < Struct.new(:condition, :body)
  def inspect
    "<<#{self}>>"
  end

  def reduce(environment)
    [If.new(condition, Sequence.new(body, self), DoNothing.new), environment]
  end

  def reducible?
    true
  end

  def to_s
    "while (#{condition}) { #{body} }"
  end
end

class Machine < Struct.new(:statement, :environment)
  def step
    self.statement, self.environment = statement.reduce(environment)
  end

  def run
    while statement.reducible?
      puts "#{statement}, #{environment}"
      step
    end
    puts "#{statement}, #{environment}"
  end
end
