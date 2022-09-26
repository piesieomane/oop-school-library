class Person
  attr_accessor :name, :age, :id
  attr_writer :name, :age

  def initialize(name = 'Unknown', age, parent_permission: true)
    @name = name
    @age = age
    @id = id
    @parent_permission = parent_permission
  end

  Private
  def is_of_age?
    @age >= 18
  end

  def can_use_services?
    if is_of_age? || @parent_permission
      true
    else
      false
    end
  end
end
