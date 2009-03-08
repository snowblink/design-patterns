module Chapter04B
  # abstract class
  class PizzaStore
    def order_pizza(pizza_type)
      pizza = create_pizza(pizza_type)

      pizza.prepare
      pizza.bake
      pizza.cut
      pizza.box
      pizza
    end

    # abstract method
    def create_pizza(pizza_type)
    end
  end

  # abstract class
  class Pizza
    attr_accessor :dough

    # abstract method
    def prepare; end

    def bake
      # puts "baking"
    end

    def cut
      # puts "cutting"
    end

    def box
      # puts "boxing"
    end
  end

  class PepperoniPizza < Pizza
  end

  class CheesePizza < Pizza
  end

  class NYStyleCheesePizza < CheesePizza
    def prepare
      @dough = NYPizzaIngredientFactory.new.create_dough
    end
  end

  class NYStylePizzaStore < PizzaStore
    def create_pizza(pizza_type)
      case pizza_type
      when :cheese
        return NYStyleCheesePizza.new
      else
        :moo
      end
    end
  end

  # Ingredient Factory
  class PizzaIngredientFactory
    def create_dough; end
    def create_sauce; end
    def create_cheese; end
    def create_veggies; []; end
    def create_pepperoni; end
    def create_clam; end
  end

  class NYPizzaIngredientFactory < PizzaIngredientFactory
    def create_dough
      :thin_crust_dough
    end
  end
end