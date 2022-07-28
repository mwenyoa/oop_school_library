require_relative '../book'
require_relative '../person'

describe 'Book object' do
  context 'should create an instance of Book class' do
    book = Book.new('Cinderella', 'Charles Perrault')

    it 'takes two parameters and returns a Book object' do
      expect(book.class) == Book
    end

    it 'returns correct names of book object instance variables' do
      expect(book.title).to eq 'Cinderella'
      expect(book.author).to eq 'Charles Perrault'

      expect(book.title).not_to eq 'Cindy'
      expect(book.author).not_to eq 'Charles'
    end

    it 'checks the availability of Book class method/s' do
      # checks if add_rental functions exist or not
      expect(Book.instance_methods(false).include?(:add_rental)).to eq true
    end

    it 'add rentals inside book rentals array' do
      person = Person.new(15, 'John', 'true')
      @rental = Rental.new(2020 / 1 / 1, book, person)
      expect(book.rentals).to eq [@rental]
    end
  end
end
