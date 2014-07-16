require 'open_weather'

class PagesController < ApplicationController

  def weather
    @results = Geocoder.search(request.remote_ip)

    @weather_info = OpenWeather::Current.city("#{@results[0].data["city"]}, #{@results[0].data["region_name"]}")

    @temp_celsius = (@weather_info["main"]["temp"].to_f-273).round(2)
    @temp_farenheit = (1.8*@temp_celsius + 32).round(2)
    
    @high_celsius = (@weather_info["main"]["temp_max"].to_f-273).round(2)
    @high_farenheit = (1.8*@high_celsius + 32).round(2)

    @low_celsius = (@weather_info["main"]["temp_max"].to_f-273).round
    @low_farenheit = (1.8*@low_celsius + 32).round(2)

    @three_digit_code = @weather_info["weather"][0]["id"].to_i
    case @three_digit_code
      when 200, 201, 202, 210, 211, 212, 221, 230, 231, 232, 960, 961
        @weather_code = "thunderstorm"
      when 300, 301, 302, 310, 311, 312, 313, 314, 321
        @weather_code = "drizzle"
      when 500, 501, 502, 503, 504, 511, 520, 521, 522, 531
        @weather_code = "rain"
      when 600, 601, 602, 611, 612, 615, 616, 620, 621, 622
        @weather_code = "snow"
      when 701, 711, 721, 731, 741, 751, 761, 762, 771
        @weather_code = "fog"
      when 781, 900
        @weather_code = "tornado"
      when 800, 801, 802, 803, 804
        @weather_code = "clouds"
      when 901, 902, 962
        @weather_code = "hurricane"
      when 903
        @weather_code = "cold"
      when 904
        @weather_code = "hot"
      when 905, 956, 957, 958, 959
        @weather_code = "wind"
      when 906 
        @weather_code = "hail"
      when 950, 951, 952, 953, 954, 955
        @weather_code = "sunny"
      end 
    end
end
