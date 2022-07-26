require './nameable'

class Person < Nameable
  attr_reader :id, :rentals
  attr_accessor :name, :age, :parent_permission

  def initialize(*args)
    @id = Random.rand(1..1000)
    @age = args[0]
    @name = args[1] || 'unknown'
    @parent_permission = args[2].nil? ? true : args[2]
    @rentals = []
    super()
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(rental)
    @rentals << rental
    rental.person = self
  end

  private

  def of_age?
    @age >= 18
  end
end
