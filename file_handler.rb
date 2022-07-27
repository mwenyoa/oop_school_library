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

def read_rental(ary, book_file, people_file)
  puts "\n**********************RENTAL************************\n"

  ary.each do |el|
    date_of_rent = el['value']['date']
    rented_book = el['value']['book']
    renter = el['value']['person']
    book = find_book_idx(rented_book, book_file)
    person = find_person_idx(renter, people_file)
    puts "Date of Rent: #{date_of_rent} Book: #{book} Person: #{person}"
    add_rental(date_of_rent, book, person)
  end
end

def find_book_idx(ref, path_file)
  find = JSON.parse(path_file)
  find.each_with_index do |el, i|
    return i if ref == el['ref']
  end
end

def find_person_idx(ref, path_file)
  find = JSON.parse(path_file)
  find.each_with_index do |el, i|
    return i if ref == el['ref']
  end
end
