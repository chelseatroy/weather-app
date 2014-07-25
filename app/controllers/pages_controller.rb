class PagesController < ApplicationController

  def weather
    @weather = Weather.new("50.200.5.113")
  end
  
end
