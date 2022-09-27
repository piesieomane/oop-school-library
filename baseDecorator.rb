require_relative 'nameable'

class BaseDecorator < Nameable
    def initialize(nameable)
        @nameable = nameable
    end

    def correct_name
        @nameable.correct_name
    end
end

class CapitalizeDecorator < Nameable
    def correct_name
        @nameable.correct_name.capitalize
    end
end

class TrimmerDecorator < Nameable
end