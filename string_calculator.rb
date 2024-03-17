class StrCalculator
  def initialize(str)
    @str = str
  end

  def str_calculate
    if @str.empty?
      "empty str"
    else
      delimiter, numbers = extract_delimiter_and_numbers(@str)
      numbers.split(delimiter).map(&:to_i).inject(:+)
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
end

# Test cases
calculator1 = StrCalculator.new("1\n2,3")
puts calculator1.str_calculate  # Output: 6 (1 + 2 + 3)

calculator2 = StrCalculator.new("//;\n1;2")
puts calculator2.str_calculate  # Output: 3 (1 + 2)

calculator3 = StrCalculator.new("3\n1")
puts calculator3.str_calculate  # Output: 4 (3 + 1)
