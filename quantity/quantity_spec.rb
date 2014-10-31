# Copyright 2014 by Fred George. May be copied with this notice, but not used in classroom training.

require 'rspec'
require_relative 'quantity'

# Confirms Quantity operates correctly
RSpec.describe Quantity do

  it "should understand equality of same unit" do
    expect(Quantity.new(3, Unit::TABLESPOON))
        .to eq(Quantity.new(3, Unit::TABLESPOON))
    expect(Quantity.new(3, Unit::TABLESPOON)).not_to eq(Object.new)
    expect(Quantity.new(3, Unit::TABLESPOON)).not_to eq(nil)
  end

  it 'should understand equality across different units' do
    expect(Quantity.new(1, Unit::TABLESPOON))
        .to eq(Quantity.new(3, Unit::TEASPOON))
    expect(Quantity.new(0.5, Unit::GALLON))
        .to eq(Quantity.new(8, Unit::CUP))
    expect(Quantity.new(8, Unit::CUP))
        .to eq(Quantity.new(0.5, Unit::GALLON))
  end

  it 'should prohibit creation of new Units' do
    expect { Unit.new }.to raise_error(NoMethodError)
  end

end
