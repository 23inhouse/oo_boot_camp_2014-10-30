# Copyright 2014 by Fred George. May be copied with this notice, but not used in classroom training.

require 'rspec'
require_relative 'chance'

# Confirms Chance operates correctly
RSpec.describe Chance do
  it "should understand equality" do
    expect(Chance.new(0.25)).to eq(Chance.new(0.25))
    expect(Chance.new(0.25)).not_to eq(Object.new)
    expect(Chance.new(0.25)).not_to eq(nil)
    expect(Chance.new(0.25)).not_to eq('hello')
  end
end
