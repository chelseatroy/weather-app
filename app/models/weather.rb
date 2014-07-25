class Weather

  attr_reader :results, :weather_info, :temp_celsius, :temp_farenheit

  def initialize(ip_address)
    @results = Geocoder.search(ip_address)
    @latitude = @results[0].data["latitude"]
    @longitude = @results[0].data["longitude"]
    @weather_info = Unirest.get("https://api.forecast.io/forecast/84ca85501594f1f895a1262372c54758/#{@latitude},#{@longitude}", headers:{ "Accept" => "application/json" }).body
    @temp_farenheit = @weather_info["currently"]["temperature"]
    @temp_celsius = convert_to_celsius(@temp_farenheit)
    
  end

  def convert_to_celsius(t_in_farenheit)
    ((t_in_farenheit - 32)/1.8).round(2)
  end

  def weather_code
    @icon = @weather_info["minutely"]["icon"]
  end

end