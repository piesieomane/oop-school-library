require_relative 'book'
require_relative 'student'
require_relative 'rental'
require_relative 'person'
require_relative 'teacher'

class App
    attr_accessor :books, :people, :rentals

    def initialize 
        @books = []
        @people = []
        @rentals = []
    end
def list_all_books
    if @books.length > 0
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
    if person_type != '1' && person_type != '2'
        puts 'Invalid option'
        return
    end
    puts 'Age:'
    age = gets.chomp
    puts 'Name:'
    name = gets.chomp
    if person_type == '1'
        puts 'Has parent permission? [Y/N]'
        parent_permission = gets.chomp
        parent_permission = parent_permission.downcase == 'y'
        person = Student.new(age, name, parent_permission)
        @people << person
    else
        puts 'Specialization:'
        specialization = gets.chomp
        person = Teacher.new(age, specialization, name)
        @people << person
    end
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

def list_all_rentals_for_a_person
    puts 'ID of person:'
    id = gets.chomp.to_i
    puts 'Rentals:'
    @rentals.each do |rental|
        puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}" if rental.person.id == id
    end
end
end