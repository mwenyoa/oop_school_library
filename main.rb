require './app'

class Main
  def initialize
    @app = App.new
  end

  def options
    puts "
        1 - List all books.
        2 - List all people.
        3 - Create a person.
        4 - Create a book.
        5 - Create a rental.
        6 - List all rentals for a given person id.
        7 - Exit
        "
  end

  def welcome
    puts 'Welcome to School Library App!'
    puts ''
    puts 'Please choose an option by entering a number'

    loop do
      options

      user_option = gets.chomp

      break if user_option == '7'

      @app.get_option(user_option)
    end
    puts 'Thank you for using the Library app!'
  end
end

main = Main.new
main.welcome
