# Copyright 2014 by Fred George. May be copied with this notice, but not used in classroom training.

require_relative 'unit'

# Undestands a particular amount
class Quantity
  attr_reader :amount, :unit
  protected :amount, :unit

  def initialize(amount, unit)
    @amount, @unit = amount, unit
  end

  def ==(other)
    return true if self.equal? other
    return false unless self.class === other
    self.amount == convertedAmount(other)
  end

  private

    def convertedAmount(other)
      self.unit.convertedAmountFrom(other.amount, other.unit)
    end

  TEASPOON = Object.new
  TABLESPOON = Object.new
  OUNCE = Object.new
end
