require_relative 'person'

class Student < Person
    attr_reader :classroom

    def initialize(id ,age, classroom, name = 'Unknown', parent_permission: true)
        super(id, age, name, parent_permission)
        @classroom = classroom
    end
end