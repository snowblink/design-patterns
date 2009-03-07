require File.dirname(__FILE__) + '/test_helper.rb'
require File.dirname(__FILE__) + '/../lib/chapter_02.rb'

# Observer Pattern

class TestChapter02 < Test::Unit::TestCase
  context "Weather Data" do
    setup do
      @weather_data = WeatherData.new
      @weather_data.temperature = 20
      @weather_data.humidity = 40
      @weather_data.pressure = 50
      @display = Display.new
      @weather_data.displays << @display
    end
    should "be able to read temperature" do
      assert_equal 20, @weather_data.temperature
    end
    should "be able to read humidity" do
      assert_equal 40, @weather_data.humidity
    end
    should "be able to read pressure" do
      assert_equal 50, @weather_data.pressure
    end
    # should "do something when the measurements change" do
    #   @weather_data.expects(:measurements_changed)
    #   @weather_data.temperature = 10
    # end
    should "update display" do
      @display.expects(:temperature=).with(20)
      @weather_data.temperature = 20
      @weather_data.measurements_changed
    end
  end
end