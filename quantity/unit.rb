# Copyright 2014 by Fred George. May be copied with this notice, but not used in classroom training.

# Undestands a particular metric
class Unit
  attr_reader :base_unit_amount
  protected :base_unit_amount

  def initialize(amount = 1, base_unit = nil)
    other_base_unit_amount = base_unit ? base_unit.base_unit_amount : 1
    @base_unit_amount = amount.to_f * other_base_unit_amount
  end

  def convertedAmountFrom(other_amount, other)
    other_amount * other.base_unit_amount / self.base_unit_amount
  end

  TEASPOON = Unit.new
  TABLESPOON = Unit.new(3, TEASPOON)
  OUNCE = Unit.new(2, TABLESPOON)
  CUP = Unit.new(8, OUNCE)
  PINT = Unit.new(2, CUP)
  QUART = Unit.new(2, PINT)
  GALLON = Unit.new(4, QUART)

  private_class_method :new

end
