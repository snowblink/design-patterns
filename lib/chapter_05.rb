module Chapter05
  class Singleton
    class << self
      attr_accessor :unique_instance
    
      def get_instance
        @unique_instance ||= Singleton.new
      end
    end
    
    private
    def initialize
    end
  end

  class ChocolateBoiler
    attr_accessor :empty, :boiled
    def initialize
      @empty = true
      @boiled = false
    end 
    
    def fill
      if is_empty?
        @empty = false
        @boiled = false
      end
    end
    
    def drain
      if(!is_empty? && is_boiled?)
        @empty = true
      end
    end
    
    def is_empty?
      empty
    end
    
    def is_boiled?
      boiled
    end
    
    def boil
      if(!is_empty? && !is_boiled?)
        @boiled = true
      end
    end 
  end

end