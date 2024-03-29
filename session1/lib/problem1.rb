class BirdSystem
    # @param [Array<Integer>] bird_day_count
    def initialize(bird_day_count)
        if bird_day_count.length != 7
            raise ArgumentError, "bird_day_count must have 7 elements"
        end
        @bird_day_count = bird_day_count
    end

    def week_bird_visit_count
        @bird_day_count.to_s
    end

    # exercise 1
    def total_week_count
        @bird_day_count.sum
    end

    # exercise 2
    def yesterday_bird_count
        @bird_day_count[-1]
    end

    # exercise 3
    def five_days_or_more_bird_count
        @bird_day_count.select { |count| count >= 5 }.length
    end

    # exercise 4
    def days_without_birds?
        @bird_day_count.any? { |count| count == 0 }
    end
end