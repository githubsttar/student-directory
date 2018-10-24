def input_students
  puts "Please enter the name of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  origin = gets.chomp
  height = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty?do
    # add the student hash to the array
    students << {name: name, cohort: :november, origin: origin, height: height}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
    origin = gets.chomp
    height = gets.chomp
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
  while counter < students.length do
    students.each do |student|
      twelve = 12
      name = student[:name]
      if name.length < twelve
        s = "#{counter}. #{student[:name]}, #{student[:origin]}, #{student[:height]}, (#{student[:cohort]} cohort)"
        puts s.center(50)
        counter += 1
      end

    end

  end

end


def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
