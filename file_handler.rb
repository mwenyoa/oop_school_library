require 'json'
require './create_file_directory'
module Library_Handler
  def save_book(books)
    book_data = []
    create_files
    file = 'data/books.json'
    return unless File.exist?(file)

    books.each do |book|
      book_data << { Title: book.title, Author: book.author }
    end
    File.write(file, book.json)
  end
end

#  load people
def read_people(file)
  puts "\n**********************PEOPLE************************\n"

  file.each do |el|
    case el['value']['type']
    when 'Student'
      student_classroom = el['value']['classroom']
      student_age = el['value']['age']
      student_name = el['value']['name']
      has_permission = el['value']['has_permission']
      puts "Classroom: #{student_classroom} Student Age: #{student_age} Student Name #{student_name}"
      add_student(student_classroom, student_age, student_name, has_permission)
    when 'Teacher'
      teacher_specialization = el['value']['specialization']
      teacher_age = el['value']['age']
      teacher_name = el['value']['name']
      puts "Teacher Specialization: #{teacher_specialization} Age: #{teacher_age} Teacher's Name #{teacher_name}"
      add_teacher(teacher_specialization, teacher_age, teacher_name, true)
    end
  end
end
