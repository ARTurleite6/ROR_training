class AssemblyLine
    @@BASE_SPEED_PRODUCTION = 221
    @@SUCCESS_RATES = [[0..0, 0], [1..4, 1], [5..8, 0.90], [9..9, 0.80], [10..10, 0.77]]

    def initialize(speed = 0)
        self.speed = speed
    end

    def speed=(value)
        unless (0..10).include?(value)
            raise ArgumentError, "the value o speed must be between 0 and 10"
        end
        @speed = value
    end

    def speed
        @speed
    end

    def production_rate
        success_rate = AssemblyLine.get_success_rate(@speed)
        @speed * @@BASE_SPEED_PRODUCTION * success_rate
    end

    def items_per_minute
        (production_rate / 60).floor
    end

    def self.get_success_rate(current_speed)
        puts current_speed
        elem = @@SUCCESS_RATES.select { |speed, _| speed.include?(current_speed) }.first
        if not elem.nil?
            elem[1] 
        else
            raise Exception, "Wrong speed passed"
        end
    end
end