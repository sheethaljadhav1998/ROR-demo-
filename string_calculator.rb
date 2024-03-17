def str_calculator(str)
  #Split the string by commas
  str = str.split(',')
  return "empty string" if str.empty?

  # Convert strings to integers and sum them
  str.map(&:to_i).inject(0, :+)
end

puts str_calculator("")   #empty string as input
