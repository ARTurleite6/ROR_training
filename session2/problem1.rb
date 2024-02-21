class ProverbGenerator
  # @param objects [Array<String>]
  def initialize(*objects)
    raise ArgumentError, 'You need to give at least 2 elements' if objects.length < 2

    # @type [Array<String>]
    @objects = [*objects]
  end

  # @returns [Array<String>]
  def answer
    # @param elem [String]
    # @param index [Integer]
    values = @objects[..-2].each_with_index.map do |elem, index|
      get_string(elem, @objects[index + 1])
    end

    values << get_string(@objects[0])
  end

  private

  # @param first_element [String]
  # @param second [String]
  def get_string(first_element, *second_element)
    if !second_element.empty?
      "For want of a #{first_element} the #{second_element[0]} was lost."
    else
      "And all for the want of a #{first_element}"
    end
  end
end

begin
  p = ProverbGenerator.new 'nail'
  puts p.answer
rescue ArgumentError => e
  puts e
end
