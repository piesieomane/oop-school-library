require_relative 'book'
require_relative 'student'
require_relative 'rental'
require_relative 'person'
require_relative 'teacher'


def list_all_books
    books = book.new();
    books.rentals.each {|book| puts "#{book.title}, #{book.author}"}
end

def list_all_people
end

def create_a_person
end

def create_a_book
end

def create_a_rental
end

def list_all_rentals_for_a_person
end
