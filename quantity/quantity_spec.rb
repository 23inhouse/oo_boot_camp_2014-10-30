# Copyright 2014 by Fred George. May be copied with this notice, but not used in classroom training.

require 'rspec'
require_relative 'quantity'

# Confirms Quantity operates correctly
RSpec.describe Quantity do

  it "should understand equality of same unit" do
    expect(3.tablespoons).to eq(3.tablespoons)
    expect(3.tablespoons).not_to eq(Object.new)
    expect(3.tablespoons).not_to eq(nil)
  end

  it 'should understand equality across different units' do
    expect(1.tablespoons).to eq(3.teaspoons)
    expect(0.5.gallons).to eq(8.cups)
    expect(8.cups).to eq(0.5.gallons)
  end

  it 'should prohibit creation of new Units' do
    expect { Unit.new }.to raise_error(NoMethodError)
  end

end
