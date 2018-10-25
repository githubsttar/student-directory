@students = [] # empty array accessible to all methods

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load students"
  puts "9. Exit" # 9 becasue we'll be adding more items
end

def interative_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit # this will cause the program to terminate
  else
    puts "I don't know what you meant, try again"
  end
end

def student_file
  @students
end

def input_students
  puts "Please enter the name of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.chomp
  origin = STDIN.gets.chomp
  height = STDIN.gets.chomp
  cohort = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty?do
    # add the student hash to the array
    student_file << {name: name, origin: origin, height: height, cohort: cohort}
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = STDIN.gets.chomp
    origin = STDIN.gets.chomp
    height = STDIN.gets.chomp
    cohort = STDIN.gets.chomp
  end
end

def show_students
  print_header
  print_students_list
  print_footer
end

def print_header
puts "The students of villains Academy"
puts "-----------"
end

def print_students_list
  counter = 1
    @students.each do |student|
      puts "#{student[:name]}, #{student[:origin]}, #{student[:height]}, (#{student[:cohort]})".center(50)
    end
end

def print_footer
    puts "Overall, we have #{@students.count} great students"
end

def save_students
  # open the file for writing
  puts "Which file would you like to write into?"
  file = File.open(gets.chomp, "w")
  # iterate over the array of the students
  @students.each do |student|
    student_data = [student[:name], student[:origin], student[:height], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
  puts "Student file opened and closed successfully!"
end

def load_students(filename = gets.chomp)
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
    name, origin, height, cohort = line.chomp.split(', ')
    student_file << {name: name, origin: origin, height: height, cohort: cohort}
  end
  file.close
  puts "Student data saved successfully!"
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  #return if filename.nil? # get out of the method if it isn't given
  if filename.nil?
    puts "Select your file please"
    load_students
    puts "Loaded #{@students.count} from #{filename}"
  elsif File.exists?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end


try_load_students
interative_menu
