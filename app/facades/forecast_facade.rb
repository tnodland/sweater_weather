class ForecastFacade
  def initialize(location)
    @location = location
  end

  def image
    coords = self.lat_long
    service = FlikrService.new
    service.get_image(coords)
  end

  def current_weather
    weather = self.weather
    return weather[:currently]
  end

  def hourly_weather
    weather = self.weather
    return weather[:hourly]
  end

  def daily_weather
    weather = self.weather
    return weather[:daily]
  end

  def lat_long(location = @location)
    @_lat_long ||= GoogleService.new.get_coords(location)
  end

  def weather
    @_weather ||= DarkskyService.new.location_forecast(self.lat_long[:lat], self.lat_long[:lng])
  end
  private

end
