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

def list_books
  if @books.empty?
    puts 'No book added yet'
    return
  end
  @books.map do |book|
    puts "Title: \"#{book.title}\", Author: #{book.author}"
  end
end