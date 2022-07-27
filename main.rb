require_relative './app'
require_relative './data_output_file'
require_relative './create_file_directory'

def main
  app = App.new
  Dir.exist?('./data') ? app.read_files : nil
  loop do
    data_output_file
    choose_action(app)
  end
end

def choose_action(app)
  choice = gets.chomp
  case choice
  when '1'
    app.display_books
  when '2'
    app.display_people
  when '3'
    app.create_person
  when '4'
    app.create_book
  when '5'
    app.create_rental
  when '6'
    app.display_rental
  else
    exit_app(app)
  end
end

def exit_app(app)
  puts 'Thank you application exiting... kindly wait'
  create_dir
  app.save_files
  exit
end

main
