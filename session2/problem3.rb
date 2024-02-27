# frozen_string_literal: true

class Animal
  def initialize(hungry_level = 0)
    @hungry_level = hungry_level
    puts 'Initialize method in Animal'
  end

  def eat(food_ammount)
    @hungry_level -= food_ammount
    @hungry_level = 0 if @hungry_level.negative?
  end
end

module Domesticable
  def self.included(base)
    base.class_eval do
      attr_accessor :owner
      attr_reader :name
    end
  end

  def eat(food_ammount)
    @hungry_level -= food_ammount
    @hungry_level = 0 if @hungry_level.negative?
    puts "Owner #{owner} feeding animal #{@name}"
  end
end

module CanFly
  def fly
    puts "I'm flying..."
  end
end

class Bird < Animal
  include Domesticable
  include CanFly

  def initialize(name, owner, hungry_level = 0)
    super(hungry_level)
    @owner = owner
    @name = name
  end
end

class Dog < Animal
  include Domesticable

  def initialize(owner, name, hungry_level = 0)
    super(hungry_level)
    @owner = owner
    @name = name
  end
end

class Cat < Animal
  include Domesticable

  def initialize(owner, name, hungry_level = 0)
    super(hungry_level)
    @owner = owner
    @name = name
  end
end
