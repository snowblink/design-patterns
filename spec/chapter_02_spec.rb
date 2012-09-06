require 'spec_helper'

# Observer Pattern

describe WeatherData do
  before(:each) do
    @weather_data = WeatherData.new
    @weather_data.temperature = 20
    @weather_data.humidity = 40
    @weather_data.pressure = 50
    @display = Display.new
    @weather_data.displays << @display
  end

  it "reads the temperature" do
    @weather_data.temperature.should == 20
  end

  it "reads the humidity" do
    @weather_data.humidity.should == 40
  end

  it "reads the pressure" do
    @weather_data.pressure.should == 50
  end

  it "updates the display" do
    @display.should_receive(:temperature=).with(20)
    @weather_data.temperature = 20
    @weather_data.measurements_changed
  end
end