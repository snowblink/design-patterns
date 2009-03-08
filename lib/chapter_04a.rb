class PizzaStore
  attr_accessor :factory

  def initialize(factory)
    @factory = factory
  end

  def order_pizza(pizza_type)
    pizza = factory.create_pizza(pizza_type)

    pizza.prepare
    pizza.bake
    pizza.cut
    pizza.box
    pizza
  end
end

class Pizza
  def prepare; end
  def bake; end
  def cut; end
  def box; end
end

class PepperoniPizza < Pizza
end

class CheesePizza < Pizza
end

class SimplePizzaFactory
  def create_pizza(pizza_type)
    case pizza_type
    when :cheese
      pizza = CheesePizza.new
    when :pepperoni
      pizza = PepperoniPizza.new
    end
    pizza
  end
end

class NYPizzaFactory < SimplePizzaFactory
end