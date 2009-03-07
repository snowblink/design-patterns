class WeatherData
  attr_accessor :temperature, :humidity, :pressure, :displays
  
  def initialize
    @displays = []
  end
  
  def measurements_changed
    @displays.each do |display|
      display.temperature = @temperature
    end
  end
end

class Display
  attr_accessor :temperature, :humidity, :pressure
  
  def to_s
    "The current temperature(#{temperature}), humidity(#{humidity}, and pressure(#{pressure}))"
  end
end