class Assign < Struct.new(:name, :expression)
  def evaluate(environment)
    environment.merge({name => expression.evaluate(environment)})
  end

  def inspect
    "<<#{self}>>"
  end

  def to_s
    "#{name} = #{expression}"
  end
end
