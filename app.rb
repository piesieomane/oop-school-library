require_relative 'book'
require_relative 'student'
require_relative 'rental'
require_relative 'person'
require_relative 'teacher'
require_relative 'classroom'

class App
  attr_accessor :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def start
    puts 'Welcome to School Library App!'
    list_of_options
  end

  def list_all_books
    if @books.length.positive?
      @books.each do |book|
        puts "Title: #{book.title}, Author: #{book.author}"
      end
    else
      puts 'No books found'
    end
  end

  def list_all_people
    @people.each do |person|
      puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def create_a_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
    person_type = gets.chomp
    case person_type
    when '1'
      create_a_student
    when '2'
      create_a_teacher
    else
      puts 'That is not a valid input'
      create_a_person
    end
  end

  def create_a_student
    puts 'Age:'
    age = gets.chomp
    puts 'Name:'
    name = gets.chomp
    puts 'Has parent permission? [Y/N]'
    parent_permission = gets.chomp
    parent_permission = parent_permission.downcase == 'y'
    student = Student.new(nil, age, name, parent_permission)
    @people << student
    puts 'Person(Student) created successfully'
  end

  def create_a_teacher
    puts 'Age:'
    age = gets.chomp
    puts 'Name:'
    name = gets.chomp
    puts 'Specialization:'
    specialization = gets.chomp
    teacher = Teacher.new(age, specialization, name)
    @people << teacher
    puts 'Person(Teacher) created successfully'
  end

  def create_a_book
    puts 'Title:'
    title = gets.chomp
    puts 'Author:'
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    puts 'Book created'
  end

  def create_a_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title}, Author: #{book.author}"
    end
    puts 'Book number:'
    book_index = gets.chomp.to_i
    book = @books[book_index]
    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_index = gets.chomp.to_i
    person = @people[person_index]
    puts 'Date:'
    date = gets.chomp
    @rentals << Rental.new(date, person, book)
  end

  def list_all_rentals
    puts 'ID of person:'
    id = gets.chomp.to_i
    puts 'Rentals:'
    @rentals.select { |rental| rental.person.id == id }.each do |rental|
      puts "Date: #{rental.date}, Book '#{rental.book.title}' by #{rental.book.author}"
    end
  end
end
