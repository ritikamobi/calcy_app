# lib/string_calculator.rb

class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?
    delimiters = [",", "\n"]
    #segregating delimiters and adding numbers
    nums = numbers.split(/,|\n/).map(&:to_i)
    nums.sum
  end
end
