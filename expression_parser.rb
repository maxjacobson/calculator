class ExpressionParser
  attr_reader :numbers, :operations
  def initialize(expression)
    @expression = expression
    parts = expression.split(' ')
    @numbers, @operations = parts.group_by do |part|
      part =~ /^(?:\-)?\d+$/
    end.values
    @numbers = @numbers.map(&:to_i)
    @operations = @operations.map(&:to_sym)
  end

  private

  attr_reader :expression
end
