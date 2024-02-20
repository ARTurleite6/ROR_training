class Problem4
    # @param values [Array<Integer>]
    def initialize(values)
        @values = values
    end

    # @return [Array<Integer>]
    def answer

        num = @values.length

        left_products = Array.new(num, 1)
        right_products = Array.new(num, 1)

        left_product = 1

        (1...num).each do |i|
            left_product *= @values[i - 1]
            left_products[i] = left_product
        end

        right_product = 1

        (num-2).downto(0).each do |i|
            right_product *= @values[i+1]
            right_products[i] = right_product
        end

        answers = Array.new(num, 1)

        (0...num).each do |i|
            answers[i] = left_products[i] * right_products[i]
        end

        answers
    end
end
