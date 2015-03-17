require 'rspec'
require './expression_parser'

describe ExpressionParser do
  context 'when there are 2 numbers' do
    it 'pulls out numbers and operations from an expression' do
      parser = ExpressionParser.new('6 3 +')
      expect(parser.numbers).to eq [6, 3]
      expect(parser.operations).to eq [:+]
    end
  end

  context 'when there are 3 numbers' do
    it 'pulls the ouners and operarns' do
      parser = ExpressionParser.new('13 3 7 + -')
      expect(parser.numbers).to eq [13, 3, 7]
      expect(parser.operations).to eq [:+, :-]
    end
  end

  context 'when there are 5 numbers' do
    it 'is ok' do
      parser = ExpressionParser.new('-12 2 3 4 5 + - * /')
      expect(parser.numbers).to eq [-12, 2, 3, 4, 5]
      expect(parser.operations).to eq [:+, :-, :*, :/]
    end
  end
end
