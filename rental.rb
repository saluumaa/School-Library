require './book'
require './person'

class Rental
  attr_accessor :date
  attr_reader :book, :person
  
  def initialize(book, person, date)
    @book = book
    @person = person
    @date = date

    book.add_rental(self)
    person.add_rental(self)
  end

  def book=(book)
    @book = book
    book.add_rental(self)
  end

  def person=(person)
    @person = person
    person.add_rental(self)
  end
end

book 1 = Book.new('Harry Potter', 'J. K. Rowling')
book 2 = Book.new('Lord of the Rings', 'J. R. R. Tolkien')

person 1 = Person.new(22, name: 'Maximilianus')
person 2 = Person.new(24, name: 'John Doe')

rental 1 = Rental.new(book 1, person 1, '2021-01-01')
rental 2 = Rental.new(book 2, person 2, '2021-01-02')

puts rental 1.book.title
puts rental 1.person.name
puts rental 1.date

puts rental 2.book.title
puts rental 2.person.name
puts rental 2.date