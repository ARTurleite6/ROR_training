require 'set'

class Problem3

    def initialize(values, value)
        @values = values
        @value = value
    end

    #@param values [Array<Integer>]
    #@param number [Integer]
    def find_pair_with_sum(values, number)
        visited_numbers = Set.new

        values.each do |value|
            rest = number - value 

            if visited_numbers.include?(rest)
                return [rest, value]
            end

            visited_numbers.add(value)
        end

    end

    #@param values [Array<Integer>]
    def answer
        first, second = find_pair_with_sum(@values, @value)

        [@values.index { |element| element == first }, @values.index { |element| element == second }]
    end
end

VALUES = [2, 11, 7, 15].freeze
VALUE = 9.freeze

problem_solver = Problem3.new(VALUES, VALUE)

puts "Answer: #{problem_solver.answer}"