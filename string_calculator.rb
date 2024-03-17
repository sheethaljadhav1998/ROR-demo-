def str_calculator(str)
  #Split the string by commas
  str = str.split(/,\s*/)

  # Convert strings to integers and sum them
  str.map(&:to_i).inject(0, :+)
end

puts str_calculator("")   #empty string as input
