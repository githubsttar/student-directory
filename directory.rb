@students = [] # empty array accessible to all methods

def input_students
  puts "Please enter the name of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = gets.chop
  origin = gets.chop
  height = gets.chop
  cohort = gets.chop
  # while the name is not empty, repeat this code
  while !name.empty?do
    # add the student hash to the array
    @students << {name: name, cohort: cohort, origin: origin, height: height}
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = gets.chop
    origin = gets.chop
    height = gets.chop
    cohort = gets.chop
  end
end

def interative_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit" # 9 becasue we'll be adding more items
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "9"
    exit # this will cause the program to terminate
  else
    puts "I don't know what you meant, try again"
  end
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

interative_menu
# print_header
# print_students_list
# print_footer
