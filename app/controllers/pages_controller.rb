require 'open_weather'

class PagesController < ApplicationController

  def weather
    @weather = Weather.new
  end
  
end
