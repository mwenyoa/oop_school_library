require_relative './person'

# teacher represents a teacher in the library
class Teacher < Person
  def initialize(specialization, age, name = 'Unknown')
    super(name, age)
    @specialization = specialization
  end

  def can_use_service?
    true
  end
end
