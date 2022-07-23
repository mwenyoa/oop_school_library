require_relative('./person')
require_relative('./book')
require_relative('./rental')
require_relative('./student')
require_relative('./teacher')
require 'date'

class Apps
  def initialize
    @rentals = []
    @people = []
    @books = []
  end
end

# list books
def list_books
  if @books.empty?
    puts 'No book added yet'
    return
  end
  @books.map do |book|
    puts "Title: \"#{book.title}\", Author: #{book.author}"
  end
end

# list people
def list_people
  if @people.empty?
    puts 'No person record created yet'
    return
  end
  @people.map do |person|
    puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
  end
end

# create person
def create_person
  print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
  option = gets.chomp
  case option
  when '1'
    create_student
  when '2'
    create_teacher
  else
    puts 'That is not a valid input'
    return
  end
  puts 'Person created successfully'
end

# create student
def create_student
  print 'Age: '
  age = gets.chomp

  print 'Name: '
  name = gets.chomp

  student = Student.new(age, name)
  @people.push(student)
  puts 'Student Created Successfully'
end
