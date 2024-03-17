def str_calculator(str)
  return "empty str" if str.empty?

  # Split the string by commas, Convert strings to integers and sum them
  str.split(",").map(&:to_i).inject(0, :+)
end

puts str_calculator("1,2,3")   #Two or more Numbers 
