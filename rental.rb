require_relative './book'
require_relative './person'

class Rental
  attr_reader :book, :person
  attr_accessor :date

  def initialize(person, book, date)
    @date = date

    @person = person
    person.rentals << self

    @book = book
    book.rentals << self
  end
end
