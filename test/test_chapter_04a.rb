require File.dirname(__FILE__) + '/test_helper.rb'
require File.dirname(__FILE__) + '/../lib/chapter_04a.rb'

# Simple Factory Pattern

class TestChapter04a < Test::Unit::TestCase
  context "A PizzaStore" do
    setup do 
      @simple_pizza_factory = SimplePizzaFactory.new
      @pizza_store = PizzaStore.new(@simple_pizza_factory)
    end

    should "be able to order a cheese pizza" do
      @cheese_pizza = CheesePizza.new
      CheesePizza.expects(:new).returns(@cheese_pizza)
      assert_equal @cheese_pizza, @pizza_store.order_pizza(:cheese)
    end
    
    should "be able to order a pepperoni pizza" do
      @pepperoni_pizza = PepperoniPizza.new
      PepperoniPizza.expects(:new).returns(@pepperoni_pizza)
      assert_equal @pepperoni_pizza, @pizza_store.order_pizza(:pepperoni)
    end
  end
  
  context "A NY Pizza Store" do
    setup do
      @ny_pizza_factory = NYPizzaFactory.new
      @ny_pizza_store = PizzaStore.new(@ny_pizza_factory)
    end
    should "get a ny style cheese pizza" do
      @ny_style_cheese_pizza = CheesePizza.new
      CheesePizza.expects(:new).returns(@ny_style_cheese_pizza)
      assert_equal @ny_style_cheese_pizza, @ny_pizza_store.order_pizza(:cheese)
    end
  end
  
end
