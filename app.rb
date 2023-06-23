require './book'
require './person'
require './rental'
require './student'
class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  ## LIST BOOKS
  def list_books
    @books.each do |book|
      puts "Title: #{book.title}", "Author: #{book.author}"
    end
  end

  ## LIST PEOPLE
  def list_people
    @people.each do |person|
      puts "Name: #{person.name}", "age: #{person.age}", "id: #{person.id}"
    end
  end

  ## CREATE STUDENT
  def create_student
    puts 'Student name:'
    name = gets.chomp
    puts 'Student age:'
    age = gets.chomp
    puts 'Has parent permission? (Y/N)'
    permission = gets.chomp.downcase
    permission = permission == 'y'
    student = Person.new(age, name: name, parent_permission: permission)
    @people.push(student)
    puts 'Student created successfully'
  end

  ## CREATE TEACHER

  def create_teacher
    puts 'Teacher name:'
    name = gets.chomp
    puts 'Teacher age:'
    age = gets.chomp
    puts 'Teacher specialization:'
    gets.chomp
    puts 'Has parent permission? (Y/N)'
    teacher = Person.new(age, name: name, parent_permission: permission)
    @people.push(teacher)
    puts 'Teacher created successfully'
  end

  ## CREATE BOOK

  def create_book
    puts 'Book title:'
    title = gets.chomp
    puts 'Book author:'
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    puts 'Book created successfully'
  end

  ## CREATE RENTAL

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title}, Author: #{book.author}"
    end
    book_index = gets.chomp.to_i
    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index do |person, index|
      puts "#{index}) Name: #{person.name}, Age: #{person.age}", "id: #{person.id}"
    end
    person_index = gets.chomp.to_i
    puts 'Date:'
    date = gets.chomp
    rental = Rental.new(date, @books[book_index], @people[person_index])
    @people[person_index].rentals.push(rental)
    puts 'Rental created successfully'
  end

  ## LIST RENTALS BY PERSON

  def list_rentals_by_person_id
    puts 'write person id'
    person_id = gets.chomp.to_i
    person = @people.find { |prson| prson.id == person_id }
    rentals = @rentals.select { |rental| rental.person == person }
    rentals.each do |rental|
      puts "Date: #{rental.date}"
      puts "Book title: #{rental.book.title}"
      puts "Book author: #{rental.book.author}"
    end
  end
end
