require 'open_weather'

class PagesController < ApplicationController

  def weather
    @results = Geocoder.search(request.remote_ip)

    weather_info = OpenWeather::Current.city("#{@results.city}, #{@results.region_name}")

    @temp_celsius = (weather_info["main"]["temp"].to_f-273).round(2)
    @temp_farenheit = 1.8*@temp_celsius + 32


  end

end
