# Copyright 2014 by Fred George. May be copied with this notice, but not used in classroom training.

# Undestands a particular metric
class Unit
  attr_reader :base_unit_amount
  protected :base_unit_amount

  def initialize(plural_name, amount = 1, base_unit = nil)
    other_base_unit_amount = base_unit ? base_unit.base_unit_amount : 1
    @base_unit_amount = amount.to_f * other_base_unit_amount
    create_numeric_method(plural_name)
  end

  def convertedAmountFrom(other_amount, other)
    other_amount * other.base_unit_amount / self.base_unit_amount
  end

  private

    def create_numeric_method(plural_name)
      unit = self
      Numeric.class_eval do
        define_method plural_name.to_s do
          Quantity.new(self, unit)
        end
      end
    end

  teaspoon = Unit.new(:teaspoons)
  tablespoon = Unit.new(:tablespoons, 3, teaspoon)
  ounce = Unit.new(:ounces, 2, tablespoon)
  cup = Unit.new(:cups, 8, ounce)
  pint = Unit.new(:pints, 2, cup)
  quart = Unit.new(:quarts, 2, pint)
  gallon = Unit.new(:gallons, 4, quart)

  private_class_method :new

end
