# Copyright 2014 by Fred George. May be copied with this notice, but not used in classroom training.

# Undestands a particular measurement
class Quantity < Struct.new(:amount, :unit)
  protected :amount, :unit

  def ==(other)
    return true if self.equal? other
    return false unless self.class === other
    self.amount == convertedAmount(other)
  end

  def -@
    Quantity.new(-amount, unit)
  end

  def +(other)
    Quantity.new(self.amount + convertedAmount(other), self.unit)
  end

  def -(other)
    self + (-other)
  end

  private

    def convertedAmount(other)
      self.unit.convertedAmountFrom(other.amount, other.unit)
    end

end
