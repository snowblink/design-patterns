require 'spec_helper'

# Singleton Pattern

describe "Chapter05::Singleton" do
  before(:each) do
    @s1 = Chapter05::Singleton.get_instance
    @s2 = Chapter05::Singleton.get_instance
  end

  it "always return the same object/instance" do
    @s1.should equal @s2
  end
end

describe "Chapter05::ChocolateBoiler" do
  before(:each) do
    @boiler = Chapter05::ChocolateBoiler.get_instance
  end

  it "be empty to able to be filled" do
    @boiler.empty = true
    @boiler.empty.should be_true
    @boiler.fill
    @boiler.empty.should be_false
    @boiler.boiled.should be_false
  end

  it "be empty" do
    @boiler.empty = false
    @boiler.should_not be_empty
    @boiler.empty = true
    @boiler.should be_empty
  end

  it "be boiled" do
    @boiler.boiled = false
    @boiler.should_not be_boiled
    @boiler.boiled = true
    @boiler.should be_boiled
  end

  it "be boiled and full to be drained" do
    @boiler.boiled = true
    @boiler.empty = true
    @boiler.drain
    @boiler.should be_empty
  end

  it "be full and not boiled to boil" do
    @boiler.boiled = false
    @boiler.empty = false
    @boiler.boil

    @boiler.should be_boiled
  end

end