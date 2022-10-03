require_relative 'app'
# puts app.create_a_book
class Refactor
  def initialize
    @app = App.new
  end

  def list_of_options
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
    option_integer = gets.chomp.to_i
    case_options(option_integer)
    extra_options(option_integer)
  end

  def case_options(option)
    case option
    when 1
      @app.list_all_books
    when 2
      @app.list_all_people
    when 3
      @app.create_a_person
    when 4
      @app.create_a_book
    when 5
      @app.create_a_rental
    when 6
      @app.list_all_rentals
    end
  end

  def extra_options(option)
    case option
    when 7
      puts 'Thank you for using this app!'
    else
      list_of_options
    end
  end
end

# def main
#   app = App.new
#   app.start
# end

# main
