require_relative '../person'
require_relative '../rental'
require_relative '../book'

describe 'Person object' do
  context 'should create an instance of Person class' do
    person = Person.new(15, 'John', 'true')

    it 'returns a Person object' do
      expect(person.class) == Person
    end

    it 'returns correct names of person object instance variables' do
      expect(person.age).to eq 15
      expect(person.name).to eq 'John'
      expect(person.parent_permission).to eq 'true'
    end

    it 'returns default constructor values' do
      expect(Person.new(20).name).to eq 'Unknown'
      expect(Person.new(20).parent_permission).to eq 'true'
    end
  end

  context 'Should test method inside Person class' do
    mary = Person.new(15, 'Mary', false)

    it "should return false because mary's age is less than 15 " do
      expect(mary.can_use_services?).to eq false
    end

    it "should return true because mary's age is set more than 18 " do
      mary.age = 18
      expect(mary.can_use_services?).to eq true
    end

    it 'should return name of object mary ' do
      expect(mary.correct_name).to eq 'Mary'
    end

    it 'should add one item inside mary rental array ' do
      book = Book.new('Cinderella', 'Charles Perrault')
      mary.add_rental(2020 / 1 / 1, book)
      expect(mary.rentals.length).to eq 2
    end
  end
end
