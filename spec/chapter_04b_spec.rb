require 'spec_helper'

# Factory Pattern

describe "Chapter04B::NYStylePizzaStore" do
  before(:each) do
    @ny_style_pizza_store = Chapter04B::NYStylePizzaStore.new
  end

  it "has a thin crust dough" do
    @ny_style_pizza_store.order_pizza(:cheese).dough.should == :thin_crust_dough
  end
end
