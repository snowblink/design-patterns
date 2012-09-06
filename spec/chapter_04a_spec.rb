require 'spec_helper'

# Simple Factory Pattern

describe "Chapter04A::PizzaStore" do
  before(:each) do 
    @simple_pizza_factory = Chapter04A::SimplePizzaFactory.new
    @pizza_store = Chapter04A::PizzaStore.new(@simple_pizza_factory)
  end

  it "can order a cheese pizza" do
    @cheese_pizza = Chapter04A::CheesePizza.new
    Chapter04A::CheesePizza.should_receive(:new).and_return(@cheese_pizza)
    @pizza_store.order_pizza(:cheese).should == @cheese_pizza
  end
  
  it "can order a pepperoni pizza" do
    @pepperoni_pizza = Chapter04A::PepperoniPizza.new
    Chapter04A::PepperoniPizza.should_receive(:new).and_return(@pepperoni_pizza)
    @pizza_store.order_pizza(:pepperoni).should == @pepperoni_pizza
  end
end

describe "Chapter04A::NYPizzaStore" do
  before(:each) do
    @ny_pizza_factory = Chapter04A::NYPizzaFactory.new
    @ny_pizza_store = Chapter04A::PizzaStore.new(@ny_pizza_factory)
  end
  it "gives a ny style cheese pizza" do
    @ny_style_cheese_pizza = Chapter04A::CheesePizza.new
    Chapter04A::CheesePizza.should_receive(:new).and_return(@ny_style_cheese_pizza)
    @ny_pizza_store.order_pizza(:cheese).should == @ny_style_cheese_pizza
  end
end
