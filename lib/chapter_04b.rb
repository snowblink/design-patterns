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
    attr_accessor :ingredient_factory
    def initialize(ingredient_factory)
      @ingredient_factory = ingredient_factory
    end

    def prepare
      @dough = ingredient_factory.create_dough
    end
  end

  class NYStyleCheesePizza < CheesePizza
    def initialize
      super(NYPizzaIngredientFactory.new)
    end
  end

  class ChicagoCheesePizza < CheesePizza
  end
  
  class NYStylePizzaStore < PizzaStore
    attr_accessor :ingredient_factory
    def initialize
      @ingredient_factory = NYPizzaIngredientFactory.new
      super
    end
    def create_pizza(pizza_type)
      case pizza_type
      when :cheese
        return CheesePizza.new(@ingredient_factory)
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