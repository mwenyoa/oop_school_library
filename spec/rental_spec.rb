require_relative '../book'
require_relative '../teacher'
require_relative '../rental'

describe 'Unit tests for class Rental' do
  before :each do
    @date = '2022/05/21'
    @book = Book.new('Noli Me Tangere', 'Jose Rizal')
    @person = Teacher.new('History', 45, 'The Teacher', true)
    @rental = Rental.new(@date, @book, @person)
  end

  context '#rental' do
    it 'should take three parameters and returns a Rental object' do
      expect(@rental).to be_an_instance_of Rental
    end
  end

  context '#date' do
    it 'should return the date of the Rental object' do
      expect(@rental.date).to eql @date
    end
  end

  context '#book' do
    it 'should return the rented book of the Rental object' do
      expect(@rental.book).to eql @book
    end
  end
  context '#person' do
    it 'should return the renter of the Rental object' do
      expect(@rental.person).to eql @person
    end
  end

  context '#rental attributes' do
    it 'should be pushed to the array rental attribute for each involved class' do
      current_date = '2022/05/21'
      new_book = Book.new('Noli Me Tangere', 'Jose Rizal')
      new_person = Teacher.new('History', 45, 'The Teacher', true)
      new_rental = Rental.new(current_date, new_book, new_person)
      expect(new_book.rentals.length).to eq 1
      expect(new_person.rentals.length).to eq 1
      expect(new_person.rentals).to eq [new_rental]
    end
  end
end
