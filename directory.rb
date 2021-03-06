@students = []
require 'csv'
# an empty array accessible to all methods
def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" #to add more items
end

def interactive_menu
loop do
  print_menu
  process(STDIN.gets.chomp)
 end
end

def process(selection)
  case selection
  when "1"
    puts "Selection to input students details"
    input_students
  when "2"
    puts "Selection to show the student details"
    show_students
  when "3"
    puts "Selection to save student details to file"
    save_students
  when "4"
    puts "Selection to load the student list from file"
    load_students
  when "9"
    exit
  else
    puts "No selection made"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
    puts "Enter student name"
    name = STDIN.gets.chomp.capitalize

    puts "Enter the student cohort"
    cohort = STDIN.gets.tr("\n","")
    puts "Enter the student country"
    country = STDIN.gets.chomp.capitalize
    puts "Enter the student height"
    height = STDIN.gets.tr("\n","")
    while true do
    at_students(name,cohort,country,height)
    if @students.count == 1
      puts "Now we have #{@students.count} student"
    else
    puts "Now we have #{@students.count} students"
    end
    puts "Enter the student name"
    name = STDIN.gets.chomp.capitalize
    if name.empty?
      break
    end
    puts "Enter the student cohort"
    cohort = STDIN.gets.tr("\n","")
    puts "Enter the student country"
    country = STDIN.gets.chomp.capitalize
    puts "Enter the student height in centimetres"
    height = STDIN.gets.tr("\n","")
  end
  puts "You have given #{@students.count} student details"
  #return the array of students
end

def show_students
  print_header
  print_students_list
  print_footer
end

def print_header
puts "The students of villains Academy".center(50)
puts "-------------".center(50)
end

def print_students_list
  count = 0
  until count == @students.length do
    if @students[count][:name].length < 12
    puts "#{count+1} #{@students[count][:name]} (#{@students[count][:cohort]}) cohort, from #{@students[count][:country]}, height #{@students[count][:height]} centimetres".center(50)
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
  @students.each do |student|
    cohort = student[:cohort]
    if cohorts_by_group[cohort.to_sym] == nil
      cohorts_by_group[cohort.to_sym] = []
    end
      cohorts_by_group[cohort.to_sym].push(student[:name])
    end
    cohorts_by_group.each do |key, value|
      puts "#{key} - #{value.join(", ")}"
    end
end

def print_footer
  #puts "Overall, we have #{students.count} great students"
if @students.count == 1
  puts "Overall, we have #{@students.count} great student"
else
  puts "Overall, we have #{@students.count} great students"
end
end

def save_students
  puts "In which file do you want to save select default"
  filename = STDIN.gets.chomp
  if filename == "default"
    filename = "students.csv"
  else
    puts "Enter valid file"
    filename = STDIN.gets.chomp
   end
  CSV.open(filename, "w") do |csv|
  @students.each do |student|
    csv << [student[:name], student[:cohort], student[:country], student[:height]]
  end
end
  puts "You have saved #{@students.count} students to file"
end

def load_students(filename = "students.csv")
  puts "In Which file do you want to load"
  choosing_file
  File.open(filename, "r") do |file|
  file.readlines.each do |line|
  name, cohort, country, height = line.chomp.split(',')
  at_students(name,cohort,country,height)
   end
 end
end

def choosing_file
  puts "Give me file name or input default for default file"
  filename = STDIN.gets.chomp
  if filename == "default"
    filename = "students.csv"
  else
    puts "Enter the file name"
    filename = STDIN.gets.chomp
  end
end

def try_load_students
  filename = ARGV.first
  if filename.nil?
    filename = "students.csv"
  end
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} students from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def at_students(name,cohort,country,height)
@students << {name: name, cohort: cohort.to_sym, country: country, height: height}
end
=begin
def interactive_menu
  students = []
  loop do
  # 1. print the menu and ask the user what to do
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
  # 2. read the input and save it into a variable
  selection = gets.chomp
  # 3. do what the user has asked
  case selection
  when "1" #input the students
    students = input_students
  when "2" #show the students
    print_header
    print(students)
    print_footer(students)
  when "9"  # this will cause the program to terminate
    exit
  else

    puts "I don't know what you meant, try again"
  end
  end
end
=end

#students = input_students
#nothing happens until we call the methods
#print_header
#print(students)
#cohort_group(students)
#print_footer(students)
try_load_students
interactive_menu
