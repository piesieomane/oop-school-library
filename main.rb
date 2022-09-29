require_relative 'App'

app = App.new

def main
  puts 'Welcome to School Library App!'
  puts
  puts 'Please choose an option by entering a number:'
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person id'
  puts '7 - Exit'
  puts

    option = gets.chomp

    case option
    when '1'
      list_all_books
    when '2'
      list_all_people
    when '3'
      create_a_person
    when '4'
      create_a_book
    when '5'
      create_a_rental
    when '6'
      list_all_rentals_for_person_id
    when '7'
      puts 'Thank you for using this app!'
      exit 0
    else
      puts 'That is not a valid option'
      main
    end
end

main