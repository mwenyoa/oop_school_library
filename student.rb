require_relative './person'

# Student  inherits from Person
class Student < Person
  def initialize(classroom, age, name: 'Unknown', parent_permission: true)
    super(name, age, parent_permission)
    @classroom = classroom
  end

  def play_holky
    "¯\(ツ)/¯"
  end
end
