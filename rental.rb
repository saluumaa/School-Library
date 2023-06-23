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

book1 = Book.new('The Great Controversy', 'Ellen G. White')
book2 = Book.new('Lord of the Rings', 'J. R. R. Tolkien')

person1 = Person.new(22, name: 'Maximilianus')
person2 = Person.new(24, name: 'John Doe', parent_permission: true)

rental1 = Rental.new(book1, person1, '2021-01-01')
rental2 = Rental.new(book2, person2, '2021-01-02')

puts rental1.book.title
puts rental1.person.name
puts rental1.date

puts rental2.book.title
puts rental2.person.name
puts rental2.date
