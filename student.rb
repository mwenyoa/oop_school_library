require_relative './person'

class Student < Person
  attr_reader :classroom

  def initialize(age, name = 'Unknown')
    @classroom = classroom
    super(age, name)
  end

  def play_hookey
    "¯\(ツ)/¯"
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
