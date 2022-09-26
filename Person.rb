class Person
    attr_accessor :name, :age, :id
    attr_writer :name, :age

    def initialize(name = "Unknown", age, parent_permission: true)
        @name = name
        @age = age
        @id = id
        @parent_permission = parent_permission
    end

    Private
    def is_of_age?
        if @age >= 18
            return true
        else
            return false
        end
    end

    def can_use_services?
        if is_of_age? || @parent_permission
            return true
        else
            return false
        end
    end
end