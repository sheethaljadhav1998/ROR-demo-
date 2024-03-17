class StrCalculator
  def initialize(str)
    @str = str
  end
  
  def str_calculate
    if @str.empty?
      "empty str"
    else
      begin
        delimiter, numbers = extract_delimiter_and_numbers(@str)
        negatives = find_negatives(numbers, delimiter)
        raise "Negative numbers not allowed: #{negatives.join(', ')}" unless negatives.empty?
        numbers.split(delimiter).map(&:to_i).inject(:+)
      rescue StandardError => e
        e.message
      end
    end
  end

  private

  def extract_delimiter_and_numbers(str)
    if str.start_with?("//")
      delimiter = str[2]
      numbers = str[(str.index("\n") + 1)..-1]
    else
      delimiter = /[,\n]+/
      numbers = str
    end
    [delimiter, numbers]
  end

  def find_negatives(numbers, delimiter)
    numbers.split(delimiter).map(&:to_i).select { |n| n < 0 }
  end
end

# Test cases
calculator1 = StrCalculator.new("1\n2,3")
puts calculator1.str_calculate  # Output: 6 (1 + 2 + 3)

calculator2 = StrCalculator.new("//;\n1;-2;-3;4;-5")
# This will print: "Negative numbers not allowed: -2, -3, -5"
puts calculator2.str_calculate

calculator3 = StrCalculator.new("3\n-1")
# This will print: "Negative numbers not allowed: -1"
puts calculator3.str_calculate
