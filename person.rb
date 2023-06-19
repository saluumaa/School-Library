class Person
  def initialize(age, name = 'Unknown', parent_permission = true)
    @id = Random.rand(1..1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
  end

  attr_accessor :age, :name
  attr_reader :id

  def can_use_services?
    @parent_permission || is_of_age?
  end

  private

  def is_of_age?
    @age.to_i >= 18
  end
end
