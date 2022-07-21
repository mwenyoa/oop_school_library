require_relative 'nameable'
# base decorator class
class Decorator < Nameable
  def initialize(nameable)
    super()
    @nameable = nameable
  end

  # setter and getter
  attr_accessor :nameable

  #   correct name method
  def correct_name
    @nameable.correct_name
  end
end

#  capitalize name decorator
class CapitalizeDecorator < Decorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end

# Trim name decorator
class TrimmerDecorator < Decorator
  def correct_name
    if @nameable.correct_name.length >= 11
      @nameable.correct_name.slice(0, 10)
    else
      @nameable.correct_name
    end
  end
end
