require File.dirname(__FILE__) + '/test_helper.rb'
require File.dirname(__FILE__) + '/../lib/chapter_01.rb'

# Strategy Pattern

class Test::Unit::TestCase
  def self.should_act_like_a_duck(duck_class)
    context "should act like a duck, so" do
      setup do
        @duck = duck_class.new
      end
      
      should "quack" do
        assert_equal :quack, @duck.quack
      end

      should "swim" do
        assert_equal :swim, @duck.swim
      end
      
      should "fly" do
        assert_equal :fly, @duck.fly
      end
    end
  end
end

class TestChapter01 < Test::Unit::TestCase
  context "A duck" do
    should_act_like_a_duck Duck

    setup do
      @duck = Duck.new
    end
    
    should "display" do
      assert_equal :abstract_display, @duck.display
    end
  end
  
  context "A mallard" do
    should_act_like_a_duck Mallard

    setup do
      @mallard = Mallard.new
    end
    
    should "display" do
      assert_equal :mallard_display, @mallard.display
    end
  end
  
  context "A redhead" do
    should_act_like_a_duck Redhead
    
    setup do
      @redhead = Redhead.new
    end
    
    should "display" do
      assert_equal :redhead_display, @redhead.display
    end
  end
  
  context "A rubber duck" do
    setup do
      @rubber_duck = RubberDuck.new
    end
    
    should "not fly" do
      assert_equal :no_way, @rubber_duck.fly
    end
  end
  
  context "A model duck" do
    setup do
      @model_duck = ModelDuck.new
    end
    
    should "not fly" do
      assert_equal :no_way, @model_duck.fly
    end
    
    should "fly if given a rocket" do
      @model_duck.flying_behaviour = DuckBehaviour::FlyingBehaviour::FlyRocketPowered.new
      assert_equal :flying_powered_by_rocket, @model_duck.fly
    end
  end
end

