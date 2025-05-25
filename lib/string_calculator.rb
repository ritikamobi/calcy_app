# lib/string_calculator.rb
class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    delimiters = [",", "\n"]
    #segregating delimiters and adding numbers
    
    if numbers.start_with?("//")
      delimiter_line, numbers = numbers.split("\n", 2)
      custom_delimiter = delimiter_line[2..-1]

      if custom_delimiter.start_with?("[") && custom_delimiter.end_with?("]")
        delimiters = custom_delimiter.scan(/\[(.*?)\]/).flatten
      else
        delimiters = [custom_delimiter]
      end
    end

    pattern = Regexp.union(delimiters)
    nums = numbers.split(pattern).map(&:to_i)

    negatives = nums.select { |n| n < 0 }
    unless negatives.empty?
      raise "negative numbers not allowed #{negatives.join(",")}"
    end

    nums.sum
  end
end
