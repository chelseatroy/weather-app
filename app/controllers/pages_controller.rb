require 'open_weather'

class PagesController < ApplicationController

  def weather
    @weather = Weather.new(request.remote_ip)
  end
  
end
