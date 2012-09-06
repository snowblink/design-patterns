require 'spec_helper'

# Decorator Pattern

describe "Coffee" do
  before do
    @coffee = Coffee.new
  end

  it "has a standard cost" do
    @coffee.cost.should == 1
  end

  context "Espresso Mocha" do
    before(:each) do
      @espresso_mocha = Condiment::Mocha.new(Espresso.new)
    end
    it "costs 2.20" do
      @espresso_mocha.cost.should == 2.20
    end
  end

  context "Espresso Double Mocha" do
    before(:each) do
      @espresso = Espresso.new
      @espresso = Condiment::Mocha.new(@espresso)
      @espresso = Condiment::Mocha.new(@espresso)
    end

    it "costs 2.40" do
      @espresso.cost.should be_within(0.01).of(2.40)
    end

    it "displays a chained description" do
      @espresso.description.should == "Espresso, Mocha, Mocha"
    end
  end
end