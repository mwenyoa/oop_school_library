require './person'
require './classroom'
require './book'
require './rental'
require './student'
require './teacher'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
    @classroom_one = Classroom.new('A')
  end

  def get_option(user_option)
    case user_option
    when '1'
      list_books
    when '2'
      list_people
    when '3'
      create_person
    when '4'
      create_book
    when '5'
      create_rental
    when '6'
      list_rentals
    end
  end

  def list_books
    puts 'The are no books registered! Please add a student or teacher.' if @books.empty?
    @books.each do |book|
      puts "Title: #{book.title} Author: #{book.author}"
    end
  end

  def list_people
    puts 'The are no people registered! Please add a student or teacher.' if @people.empty?
    @people.map do |person|
      puts "[#{person.class}] Id:#{person.id} Name:#{person.name} Age: #{person.age}"
    end
  end

  def create_person
    puts 'Do you want to create a student(1) or a teacher(2)?[input number]:'
    user_option = gets.chomp
    case user_option
    when '1'
      puts 'Age:'
      age = gets.chomp.to_i
      puts 'Do you have parent permission[Y/N]:'
      parent_permission = gets.chomp.downcase
      puts 'Name:'
      name = gets.chomp
      student = Student.new(age, name, parent_permission: parent_permission)
      @people.push(student)
      puts 'Student created successfully!'

    when '2'
      puts 'Age:'
      age = gets.chomp.to_i
      puts 'Name:'
      name = gets.chomp
      puts 'Specialization:'
      specialization = gets.chomp
      teacher = Teacher.new(age, specialization, name)
      @people.push(teacher)
      puts 'Teacher created successfully!'
    end
  end

  def create_book
    puts 'Please enter the title of the book:'
    title = gets.chomp
    puts 'Please enter the author of the book:'
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    puts 'Book created successfully!'
  end

  def create_rental
    puts 'Select a book from the list by index(not id):'
    @books.each_with_index { |book, index| puts "#{index} Title: #{book.title}, Author: #{book.author}" }
    book_index = gets.chomp.to_i

    puts 'select a person from the list by index(not id):'
    @people.each_with_index do |person, index|
      puts "#{index} [#{person.class}] Id:#{person.id} Name:#{person.name} Age: #{person.age}"
    end
    person_index = gets.chomp.to_i

    puts 'Date:'
    date = gets.chomp
    rental = Rental.new(date, @people[person_index], @books[book_index])
    @rentals.push(rental)
    puts 'Rental created successfully!'
  end

  def list_rentals
    puts 'ID of person:'
    person_id = gets.chomp.to_i

    puts 'Rentals:'
    @rentals.each do |rental|
      puts "Date: #{rental.date} Book: '#{rental.book.title}' by #{rental.book.author}" if rental.person.id == person_id
    end
  end
end
