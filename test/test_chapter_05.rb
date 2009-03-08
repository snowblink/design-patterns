require File.dirname(__FILE__) + '/test_helper.rb'
require File.dirname(__FILE__) + '/../lib/chapter_05.rb'

# Singleton Pattern

class TestChapter05 < Test::Unit::TestCase
  include Chapter05
  
  context "A Singleton" do
    setup do
      @s1 = Singleton.get_instance
      @s2 = Singleton.get_instance
    end
    
    should "always return the same object/instance" do
      assert @s1.equal?(@s2)
    end
  end
  
  context "A Chocolate Boiler" do
    setup do
      @boiler = ChocolateBoiler.new
    end
    should "be empty and not boiled" do
      assert @boiler.empty, "Boiler should be empty"
      assert !@boiler.boiled, "Boiler should not be boiled"
    end
    
    should "be empty to able to be filled" do
      @boiler.empty = true
      assert @boiler.empty, "Boiler should be empty"
      @boiler.fill
      assert_equal false, @boiler.empty, "Boiler should be full"
      assert_equal false, @boiler.boiled, "Boiler should not be boiled"
    end
        
    should "be empty" do
      @boiler.empty = false
      assert !@boiler.is_empty?, "Boiler should not be empty"
      @boiler.empty = true
      assert @boiler.is_empty?, "Boiler should be empty"
    end
    
    should "be boiled" do
      @boiler.boiled = false
      assert !@boiler.is_boiled?, "Boiler should not be boiled"
      @boiler.boiled = true
      assert @boiler.is_boiled?, "Boiler should be boiled"
    end
    
    should "be boiled and full to be drained" do
      @boiler.boiled = true
      @boiler.empty = true
      @boiler.drain
      assert @boiler.is_empty?
    end
    
    should "be full and not boiled to boil" do
      @boiler.boiled = false
      @boiler.empty = false
      @boiler.boil
      assert @boiler.is_boiled?
    end
    
  end
end