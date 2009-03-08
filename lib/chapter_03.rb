class Beverage
  attr_accessor :description, :cost
end

class Coffee < Beverage
  def cost
    1
  end
  def description
    "Regular Coffee"
  end
end

class Espresso < Beverage
  def cost
    2
  end
  def description
    "Espresso"
  end
end

require 'forwardable'
class Condiment < Beverage
  class Mocha
    attr_accessor :beverage
    def initialize(beverage)
      @beverage = beverage
    end
    def description
      @beverage.description + ', Mocha'
    end
    def cost
      0.20 + @beverage.cost
    end
  end
end