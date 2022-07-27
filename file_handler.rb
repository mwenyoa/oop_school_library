require_relative './app'

def read_book(file)
  
  puts "\n ####################*BOOKS*#################### \n"
 
  file.each do |el|
    book_title = el['value']['title']
    book_author = el['value']['author']
    puts "Book Title: #{book_title} Book Author: #{book_author}"
    add_book(book_title, book_author)
  end
end

def read_people(file)
    puts "\n ####################*PEOPLE*#################### \n" 
case el['value']['type']
when 'student'
    student_classroom = el['value']['classroom']
    student_age = el['value']['age']
    student_name =el['value']['name']
    has_permission = el['value']['has_permisssion']
    puts "classroom: #{student_classroom} Student Age #{student_age} Student Name #{student_name}"
    add_student(student_classroom,student_age,student_name,has_permisssion)
when 'Teacher'
    teacher_specialization = el['value']['specialization']
    teacher_age = el['value']['age']
    teacher_name= el['value']['name']
    puts "teacher_specialization: #{teacher_specialization} Teacher Age #{teacher_age} Teacher Name #{teacher_name}"
    add_teacher(teacher_specialization,teacher_age,teacher_name)

     end
    end
end

# handle rental

