def input_students
  puts "Please enter the name of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chop
  origin = gets.chop
  height = gets.chop
  cohort = gets.chop
  # while the name is not empty, repeat this code
  while !name.empty?do
    # add the student hash to the array
    students << {name: name, cohort: cohort, origin: origin, height: height}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chop
    origin = gets.chop
    height = gets.chop
    cohort = gets.chop
  end
  # return the array of students
  students
end

def print_header
puts "The students of villains Academy"
puts "-----------"
end

def print(students)
  counter = 1
    students.each do |student|
      my_name = student[:name]
      my_origin = student[:origin]
      my_height = student[:height]
      my_cohort = student[:cohort]
      new_hash = {}

      if new_hash[my_cohort] == nil
        #students.map { |x| new_hash[my_cohort] = x }
        new_hash[my_cohort] = my_name, my_origin, my_height
        p new_hash[my_cohort["june"]]
      else new_hash[my_cohort].push(my_name, my_origin, my_height)
      end
      # my_cohort = student[:cohort]
      # if new_array[my_cohort] == nil
      #   student.map { |x| new_hash[my_cohort] = x }
      #   puts new_array
      #   #puts "#{counter}. #{student[:name]}, #{student[:origin]}, #{student[:height]}, (#{student[:cohort]} cohort)".center(50)
      #   counter += 1
      # end
    end
end


def print_footer(students)
  if students.count >= 1
    puts "Overall, we have #{students.count} great students"
  end
end

def menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit" # 9 becasue we'll be adding more items
end

def interative_menu
  @students = []
  loop do
    # 1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. show the students"
    puts "9. Exit"
    # 2. do what the user has asked
    selection = gets.chomp
    # 3. do what the user has asked
    case selection
    when "1"
      # input the students
    when "2"
      # show the students
    when "9"
      exit # this will cause the program to terminate
    else
      puts "I don;t know what you meant, try again"
    end
  end
end

def show_students
  print_header
  @students
  print_footer(students)
end

students = interative_menu
print_header
print(students)
print_footer(students)
