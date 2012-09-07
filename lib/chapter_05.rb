module Chapter05
  class Singleton

    @@unique_instance = Singleton.new

    class << self
      # attr_accessor :unique_instance
    
      def get_instance
        # @unique_instance ||= Singleton.new
        @@unique_instance
      end
    end
    
    private_class_method :new
  end

  # turn it into a singleton
  class ChocolateBoiler
    # class << self
    #   attr_accessor :unique_instance
    #   
    #   def get_instance
    #     @unique_instance ||= ChocolateBoiler.new
    #   end
    # end

    def initialize
      @empty = true
      @boiled = false
    end 

    @@unique_instance = ChocolateBoiler.new
    def self.get_instance
      @@unique_instance
    end
    
    private_class_method :new


    attr_accessor :empty, :boiled
    def fill
      if empty?
        @empty = false
        @boiled = false
      end
    end

    def drain
      if(!empty? && boiled?)
        @empty = true
      end
    end

    def boil
      if(!empty? && !boiled?)
        @boiled = true
      end
    end

    def empty?
      empty
    end

    def boiled?
      boiled
    end
  end
end