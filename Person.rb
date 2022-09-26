class Person
    attr_accessor :name, :age, :id
    attr_writer :name, :age

    def initialize(name = "Unknown", age, parent_permission: true)
        @name = name
        @age = age
        @id = id
        @parent_permission = parent_permission
    end
end