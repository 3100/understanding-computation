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
