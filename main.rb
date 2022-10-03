require_relative 'refactor'

def main
  refactor = Refactor.new

  loop do
    refactor.list_of_options
    option = gets.chomp.to_i
    case option
    when 1..6
      refactor.dispatch(option)
    else
      break
    end
  end
end

main
