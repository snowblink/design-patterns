require File.dirname(__FILE__) + '/test_helper.rb'
require File.dirname(__FILE__) + '/../lib/chapter_03.rb'

# Decorator Pattern

class TestChapter03 < Test::Unit::TestCase
  context "A Coffee" do
    setup do
      @coffee = Coffee.new
    end

    should "have a standard cost" do
      assert_equal 1, @coffee.cost
    end
  end
  context "Espresso Mocha" do
    setup do
      @espresso_mocha = Condiment::Mocha.new(Espresso.new)
    end
    should "cost 2.20" do
      assert_equal 2.20, @espresso_mocha.cost
    end
  end
  
  context "Espresso Double Mocha" do
    setup do
      @espresso = Espresso.new
      @espresso = Condiment::Mocha.new(@espresso)
      @espresso = Condiment::Mocha.new(@espresso)
    end
    
    should "cost 2.40" do
      assert_in_delta 0.01, 2.40, @espresso.cost
    end
  end
      
end