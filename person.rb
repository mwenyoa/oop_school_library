require_relative 'nameable'
require_relative 'decorator'

class Person < Nameable
  # contructor
  def initialize(age, parent_permission: true, name: 'Unknown')
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    super()
  end

  # correct name method
  def correct_name
    @name
  end

  # getters and setters
  attr_reader :id
  attr_accessor :name, :age

  def of_age?
    @age >= 18
  end

  #  can use service method
  def can_use_service?
    @parent_permission == true || is_of_age?
  end

  private :of_age?
end
