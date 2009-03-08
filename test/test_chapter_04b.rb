require File.dirname(__FILE__) + '/test_helper.rb'
require File.dirname(__FILE__) + '/../lib/chapter_04b.rb'

# Factory Pattern

class TestChapter04B < Test::Unit::TestCase
  context "NYStylePizzaStore" do
    setup do
      @ny_style_pizza_store = Chapter04B::NYStylePizzaStore.new
    end
    
    should "have a thin crust dough" do
      assert_equal :thin_crust_dough, @ny_style_pizza_store.order_pizza(:cheese).dough
    end
  end
end
