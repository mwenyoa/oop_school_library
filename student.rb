require_relative './person'

# Student  inherits from Person 
class Student < Person
  def initialize(name = "Unknown", age, parent_permission: true, classroom)
    super(name, age,  parent_permission)
    @classroom = classroom
  end

  def play_holky
    "¯\(ツ)/¯"
  end
end