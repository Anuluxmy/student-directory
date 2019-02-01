file = File.open(__FILE__)
file.each do |line|
  puts line
end
file.close
# or
puts File.read(__FILE__)
# or
puts IO.read(__FILE__)
