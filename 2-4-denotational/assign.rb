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
