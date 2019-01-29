def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
    puts "Enter student name"
    name = gets.chomp.capitalize

    puts "Enter the student cohort"
    cohort = gets.tr("\n","")
    puts "Enter the student country"
    country = gets.chomp.capitalize
    puts "Enter the student height"
    height = gets.tr("\n","")
    while true do
    students << {name: name, cohort: cohort, country: country, height: height}
    if students.count == 1
      puts "Now we have #{students.count} student"
    else
    puts "Now we have #{students.count} students"
    end
    puts "Enter the student name"
    name = gets.chomp.capitalize
    if name.empty?
      break
    end
    puts "Enter the student cohort"
    cohort = gets.tr("\n","")
    puts "Enter the student country"
    country = gets.chomp.capitalize
    puts "Enter the student height in centimetres"
    height = gets.tr("\n","")
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
def cohort_group(students)
  cohorts_by_group = {}
  students.each do |student|
    cohort = student[:cohort]
    if cohorts_by_group[cohort] == nil
      cohorts_by_group[cohort] = []
    end
      cohorts_by_group[cohort].push(student[:name])
    end
    cohorts_by_group.each do |key, value|
      puts "#{key} - #{value.join(", ")}"
    end


end

def print_footer(students)
  #puts "Overall, we have #{students.count} great students"
if students.count == 1
  puts "Overall, we have #{students.count} great student"
else
  puts "Overall, we have #{students.count} great students"
end
end
students = input_students
#nothing happens until we call the methods
print_header
print(students)
cohort_group(students)
print_footer(students)
