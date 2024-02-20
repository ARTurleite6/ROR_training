require 'set'

class Problem3

    # @param [Array<Integer>] values
    # @param [Integer] value
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

        [@values.index(first), @values.index(second)]
    end
end