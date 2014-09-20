class Machine < Struct.new(:statement, :environment)
  def step
    self.statement, e = statement.reduce(environment)
    if e
      self.environment = e
    end
  end

  def run
    while statement.reducible?
      puts "#{statement}, #{environment}"
      step
    end
    puts "#{statement}, #{environment}"
  end
end
