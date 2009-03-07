class Duck
  attr_accessor :flying_behaviour
  
  def initialize
    @flying_behaviour = DuckBehaviour::FlyingBehaviour::Default.new
  end
  
  def quack
    :quack
  end
  
  def swim
    :swim
  end
  
  def display
    :abstract_display
  end
  
  def fly
    @flying_behaviour.fly
  end
end

class Mallard < Duck
  def display
    :mallard_display
  end
end

class Redhead < Duck
  def display
    :redhead_display
  end
end

class RubberDuck < Duck
  def quack
    :squeak
  end
  def initialize
    @flying_behaviour = DuckBehaviour::FlyingBehaviour::FlyNoWay.new
  end
end

class ModelDuck < Duck
  def initialize
    @flying_behaviour = DuckBehaviour::FlyingBehaviour::FlyNoWay.new
  end
end

module DuckBehaviour
  module FlyingBehaviour
    class Default
      def fly
        :fly
      end
    end
    class FlyWithWings
      def fly
        :flying_with_wings
      end
    end
    class FlyNoWay
      def fly
        :no_way
      end
    end
    class FlyRocketPowered
      def fly
        :flying_powered_by_rocket
      end
    end
    
  end
  module QuackingBehaviour
  end
end