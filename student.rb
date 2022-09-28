require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(id, age, classroom, name = 'Unknown', parent_permission: true)
    super(id, age, name, parent_permission)
    @classroom = classroom
  end

  def play_hockey
    '¯\(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.add_student(self) unless classroom.students.include?(self)
  end
end
