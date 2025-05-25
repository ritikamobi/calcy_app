# spec/string_calculator_spec.rb

require_relative '../lib/string_calculator'

RSpec.describe StringCalculator do
  let(:calculator) { StringCalculator.new }

  describe '#add' do
    it 'returns 0 for empty string' do
      expect(calculator.add('')).to eq(0)
    end

    it 'returns the number for single input' do
      expect(calculator.add('4')).to eq(4)
    end

    it 'returns the sum for comma-separated numbers' do
      expect(calculator.add('1,2')).to eq(3)
    end
  end
end
