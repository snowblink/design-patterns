require 'spec_helper'

# Strategy Pattern

describe Duck do

  def self.should_act_like_a_duck(duck_class)
    context "should act like a duck, so" do
      before(:each) do
        @duck = duck_class.new
      end
      
      it "quacks" do
        @duck.quack.should == :quack
      end

      it "swims" do
        @duck.swim.should == :swim
      end

      it "flys" do
        @duck.fly.should == :fly
      end
    end
  end

  context "A duck" do
    should_act_like_a_duck Duck

    before(:each) do
      @duck = Duck.new
    end
    
    it "displays" do
      @duck.display.should == :abstract_display
    end
  end
  
  context "A mallard" do
    should_act_like_a_duck Mallard

    before(:each) do
      @mallard = Mallard.new
    end
    
    it "displays" do
      assert_equal :mallard_display, @mallard.display
    end
  end
  
  context "A redhead" do
    should_act_like_a_duck Redhead
    
    before(:each) do
      @redhead = Redhead.new
    end
    
    it "displays" do
      assert_equal :redhead_display, @redhead.display
    end
  end
  
  context "A rubber duck" do
    before(:each) do
      @rubber_duck = RubberDuck.new
    end
    
    it "does not fly" do
      assert_equal :no_way, @rubber_duck.fly
    end
  end
  
  context "A model duck" do
    before(:each) do
      @model_duck = ModelDuck.new
    end
    
    it "does not fly" do
      assert_equal :no_way, @model_duck.fly
    end
    
    it "flys if given a rocket" do
      @model_duck.flying_behaviour = DuckBehaviour::FlyingBehaviour::FlyRocketPowered.new
      assert_equal :flying_powered_by_rocket, @model_duck.fly
    end
  end
end

