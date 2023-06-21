require './nameable'
require './capitalize_decorator'
require './trim_decorator'
class Person < Nameable
  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @age = age
    @name = name
    @rentals = []
    @parent_permission = parent_permission
  end

  attr_accessor :age, :name
  attr_reader :id

  def add_rental(rental)
    @rentals << rental
  end

  def correct_name
    @name
  end

  def can_use_services?
    @parent_permission || of_age?
  end

  private

  def of_age?
    @age.to_i >= 18
  end
end

person = Person.new(22, 'maximilianus')
puts person.correct_name

capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name

capitalized_trimmed_person = TrimDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name
