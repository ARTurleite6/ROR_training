class AssemblyLine
    @@BASE_SPEED_PRODUCTION = 221
    @@SUCCESS_RATES = [[1..4, 1], [5..8, 0.90], [9..9, 0.80], [10..10, 0.77]]


    def initialize(speed = 0)
        self.speed = speed
    end

    def speed=(value)
        puts value
        if not (0..10).include?(value)
            raise ArgumentError, "the value o speed must be between 0 and 10"
        end
        @speed = value
    end

    def speed
        @speed
    end

    def production_rate
        (@speed + 1) * @@BASE_SPEED_PRODUCTION
    end

    def items_per_minute
        success_rate = AssemblyLine.get_success_rate(@speed)
        ((production_rate * success_rate) / 60).floor
    end

    def self.get_success_rate(current_speed)
        elem = @@SUCCESS_RATES.select { |speed, rate| speed.include?(current_speed) }.first
        if not elem.nil?
            elem[1] 
        else
            raise Exception, "Wrong speed passed"
        end
    end
end

assembly_line = AssemblyLine.new(10)
puts "Production_rate: #{assembly_line.production_rate}"

puts "Items per minute: #{assembly_line.items_per_minute}"