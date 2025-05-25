# spec/string_calculator_spec.rb

require_relative '../lib/string_calculator'

RSpec.describe StringCalculator do
  let(:calculator) { StringCalculator.new }

  describe '#add' do
    # string with negative test case
    context "with negative numbers" do
      it "raises an error with a single negative number" do
        expect { calculator.add("9,-4,3") }.to raise_error(RuntimeError, "negative numbers not allowed -4")
      end

      it "raises an error with multiple negative numbers" do
        expect { calculator.add("-2,6,-7") }.to raise_error(RuntimeError, "negative numbers not allowed -2,-7")
      end

      it "raises an error with negative numbers and custom delimiter" do
        expect { calculator.add("//;\n-1;2;-3") }.to raise_error(RuntimeError, "negative numbers not allowed -1,-3")
      end

      it "raises an error with negative numbers and multi-char delimiter" do
        expect { calculator.add("//[***]\n-5***3***-2") }.to raise_error(RuntimeError, "negative numbers not allowed -5,-2")
      end
    end

    # empty string
    it 'returns 0 for empty string' do
      expect(calculator.add('')).to eq(0)
    end

    # single input
    it 'returns the number for single input' do
      expect(calculator.add('4')).to eq(4)
    end

    # comma-separated
    it 'returns the sum for comma-separated numbers' do
      expect(calculator.add('1,2')).to eq(3)
    end

    # string with delimiters
    it "handles new lines between numbers as delimiters" do
      expect(calculator.add("1\n2,3")).to eq(6)
      expect(calculator.add("4\n5\n6")).to eq(15)
    end

    # string with custom delimiters
    context "with custom delimiters" do
      it "supports a single-character custom delimiter" do
        expect(calculator.add("//;\n4;5")).to eq(9)
        expect(calculator.add("//|\n2|7|1")).to eq(10)
      end

      it "supports custom delimiters of any length" do
        expect(calculator.add("//[***]\n6***2***3")).to eq(11)
        expect(calculator.add("//[abc]\n3abc3abc1")).to eq(7)
      end

      it "supports multiple custom delimiters" do
        expect(calculator.add("//[*][%]\n2*1%4")).to eq(7)
        expect(calculator.add("//[;;][@@]\n1;;3@@8")).to eq(12)
      end

      it "supports multiple custom delimiters of different lengths" do
        expect(calculator.add("//[***][%%]\n6***2%%6")).to eq(14)
      end
    end
  end
end
