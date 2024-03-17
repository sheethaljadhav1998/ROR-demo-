def str_calculator(str)
  # Checking empty string, Splitting the string by commas or newlines, Convert strings to integers and sum them
   str.empty? ? "empty str" : str.split(/,\s*/).map(&:to_i).inject(0, :+)
end

puts str_calculator("1\n2,3")   #Numbers separated by newline

# Output: 6 (1 + 2 + 3)
