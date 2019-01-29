def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
    puts "Enter student name"
    name = gets.chomp.capitalize

    puts "Enter the student cohort"
    cohort = gets.chomp
    puts "Enter the student country"
    country = gets.chomp.capitalize
    puts "Enter the student height"
    height = gets.chomp.to_s
    while true do
    students << {name: name, cohort: cohort, country: country, height: height}
    puts "Now we have #{students.count} students"
    puts "Enter the student name"
    name = gets.chomp.capitalize
    if name.empty?
      break
    end
    puts "Enter the student cohort"
    cohort = gets.chomp
    puts "Enter the student country"
    country = gets.chomp.capitalize
    puts "Enter the student height in centimetres"
    height = gets.chomp.to_s
  end
  #return the array of students
  students
end

def print_header
puts "The students of villains Academy".center(50)
puts "-------------".center(50)
end

def print(students)
  count = 0
  until count == students.length do
    if students[count][:name].length < 12
    puts "#{count+1} #{students[count][:name]} (#{students[count][:cohort]}) cohort, from #{students[count][:country]}, height #{students[count][:height]} centimetres".center(50)
    end
    count += 1
  end
end
  #students.each do |student|
    #puts "#{student[:name]} (#{student[:cohort]} cohort)"
    # to print the index number
    #students.each.with_index(1) do |student, index|
      #to print name starting with A
      #if student[:name].capitalize.start_with?"S"
      #to print name length less than 12 letters
        #puts "#{index} #{student[:name]} (#{student[:cohort]} cohort)"


def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
#nothing happens until we call the methods
print_header
print(students)
print_footer(students)
