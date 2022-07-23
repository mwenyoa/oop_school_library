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