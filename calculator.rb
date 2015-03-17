require './expression_parser'

class Calculator
  def initialize(expression)
    @expression = expression
  end

  def result
    parser = ExpressionParser.new(expression)
    operations = parser.operations
    numbers = parser.numbers
    evaluate(numbers, operations)
  end

  private

  attr_reader :expression

  def evaluate(numbers, operations)
    if operations.one?
      numbers.reduce(operations.first)
    else
      last_two_numbers = numbers.slice!(-2, 2)
      last_operation = operations.shift
      numbers.push(last_two_numbers.reduce(last_operation))
      evaluate(numbers, operations)
    end
  end
end

def calculate(expression)
  Calculator.new(expression).result
end
