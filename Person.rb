class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(id, age, name = 'Unknown', parent_permission: true)
    @name = name
    @age = age
    @id = id
    @parent_permission = parent_permission
  end

  def can_use_services?
    if of_age? || @parent_permission
      true
    else
      false
    end
  end

  private

  def of_age?
    @age >= 18
  end
end
