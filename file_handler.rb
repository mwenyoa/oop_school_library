require_relative './app'

def read_book(file)
  puts "\n**********************BOOKS************************\n"

  file.each do |el|
    book_title = el['value']['title']
    book_author = el['value']['author']
    puts "Book Title: #{book_title} Book Author: #{book_author}"
    add_book(book_title, book_author)
  end
end
