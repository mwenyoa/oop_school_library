require_relative './student'
require_relative './teacher'
require_relative './book'
require_relative './rental'
require_relative './file_handler'
require 'json'

class App
  attr_accessor :book_list, :people_list, :rental_list

  def initialize
    @book_list = []
    @people_list = []
    @rental_list = []
  end

  def display_books
    @book_list.each_with_index do |book, index|
      puts "(#{index}) Title: \"#{book.title}\", Author: #{book.author}"
    end
  end

  def display_people
    @people_list.each_with_index do |person, index|
      puts "(#{index}) [#{person.type}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    choice = gets.chomp
    case choice
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Invalid option'
      nil
    end
  end

  def create_student
    print 'Age: '
    student_age = gets.chomp
    print 'Name: '
    student_name = gets.chomp.capitalize
    print 'Has parent permission? [y/n]: '
    student_parent_permission = gets.chomp
    has_permission = case student_parent_permission.downcase
                     when 'y'
                       true
                     else
                       false
                     end
    print 'Classroom: '
    student_classroom = gets.chomp
    add_student(student_classroom, student_age, student_name, has_permission)
    print "Student created successfully.\n"
  end

  def add_student(student_classroom, student_age, student_name, has_permission)
    new_student = Student.new(student_classroom, student_age, student_name, has_permission)
    @people_list << new_student
  end

  def create_teacher
    print 'Age: '
    teacher_age = gets.chomp
    print 'Name: '
    teacher_name = gets.chomp.capitalize
    print 'Specialization: '
    teacher_specialization = gets.chomp.capitalize
    add_teacher(teacher_specialization, teacher_age, teacher_name, true)
    print "Teacher created successfully.\n"
  end

  def add_teacher(teacher_specialization, teacher_age, teacher_name, has_permission)
    new_teacher = Teacher.new(teacher_specialization, teacher_age, teacher_name, has_permission)
    @people_list << new_teacher
  end

  def create_book
    print 'Title: '
    book_title = gets.chomp.capitalize
    print 'Author: '
    book_author = gets.chomp.capitalize
    add_book(book_title, book_author)
    print "Book created successfully.\n"
  end

  def add_book(book_title, book_author)
    new_book = Book.new(book_title, book_author)
    @book_list << new_book
  end

  def create_rental
    puts 'Select a book from the following list by number'
    display_books
    rented_book = gets.chomp.capitalize
    puts 'Select a person from the following list by number (not by id)'
    display_people
    renter = gets.chomp.capitalize
    puts 'Date [yyyy/mm/dd]: '
    date_of_rent = gets.chomp
    add_rental(date_of_rent, rented_book, renter)
    print "Rental created successfully.\n"
  end

  def add_rental(date_of_rent, rented_book, renter)
    new_rental = Rental.new(date_of_rent, @book_list[rented_book.to_i], @people_list[renter.to_i])
    @rental_list << new_rental
  end

  def display_rental
    print 'ID of person: '
    renter_id = gets.chomp
    puts 'Rentals: '
    list_rental_by_id(renter_id.to_i)
  end

  def list_rental_by_id(renter_id)
    @rental_list.each do |rental|
      if rental.person.id == renter_id
        puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
      end
    end
  end

  def save_files
    instance_variables.each do |var|
      file_name = var.to_s.chomp('_list').delete('@')
      ary = []
      instance_variable_get(var).each do |obj|
        hash = { ref: obj, value: to_hash(obj) }
        ary << hash
      end
      File.write("./data/#{file_name}.json", JSON.generate(ary))
    end
  end

  def read_files
    instance_variables.each do |var|
      file_name = var.to_s.chomp('_list').delete('@')

      if File.exist?("./data/#{file_name}.json") && File.read("./data/#{file_name}.json") != ''
        ary = JSON.parse(File.read("./data/#{file_name}.json"))
        case file_name
        when 'book'
          read_book(ary)
        when 'people'
          read_people(ary)
        else
          read_rental(ary, File.read('./data/book.json'), File.read('./data/people.json'))
        end
      else
        File.write("./data/#{file_name}.json", '[]')
      end
    end
  end

  private

  def to_hash(obj)
    hash = {}
    obj.instance_variables.each do |var|
      hash[var.to_s.delete('@')] = obj.instance_variable_get(var)
    end
    hash
  end
end
