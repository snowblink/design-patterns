require File.dirname(__FILE__) + '/test_helper.rb'
require File.dirname(__FILE__) + '/../lib/chapter_04b.rb'

# Factory Pattern

class TestChapter04B < Test::Unit::TestCase
  context "NYStylePizzaStore" do
    setup do
      @ny_style_pizza_store = Chapter04B::NYStylePizzaStore.new
      @ny_style_cheese_pizza = Chapter04B::NYStyleCheesePizza.new
      Chapter04B::NYStyleCheesePizza.expects(:new).returns(@ny_style_cheese_pizza)
    end
    
    should "send a NYStyleCheesePizza" do      
      assert_equal @ny_style_cheese_pizza, @ny_style_pizza_store.order_pizza(:cheese)
    end
    
    should "have a thin crust dough" do
      assert_equal :thin_crust_dough, @ny_style_pizza_store.order_pizza(:cheese).dough
    end
  end
end
