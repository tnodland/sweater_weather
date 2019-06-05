class FavoritesFacade
  def initialize(favorites)
    @favorites = favorites
  end

  def favorites
    @favorites.map do |favorite|
      coordnates = google_service.get_coords(favorite.city)
      weather = darksky_service.location_forecast(coordnates[:lat], coordnates[:lng])[:currently]
      {"location": favorite.city,
        "current_weather": {
          "temperature": weather[:temperature],
          "humidity": weather[:humidity],
          "summary": weather[:summary],
          "weather-icon": weather[:icon]
        }
      }
    end
  end

  private

    def google_service
      @_google_service ||= GoogleService.new
    end

    def darksky_service
      @_darksky_service ||= DarkskyService.new
    end
end
