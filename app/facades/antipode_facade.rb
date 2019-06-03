class AntipodeFacade
  def initialize(location)
    @location = location
  end

  def get_antipode
    pode = google_service.get_coords(@location)
    antipode = amypode_service.get_poded(pode)
    antipode_lat = antipode[:data][:attributes][:lat]
    antipode_long = antipode[:data][:attributes][:long]
    darksky_service.location_forecast(antipode_lat, antipode_long)
  end

  private

    def google_service
      @_google_service ||= GoogleService.new
    end

    def amypode_service
      @_amypode_service ||= AmypodeService.new
    end

    def darksky_service
      @_darksky_service ||= DarkskyService.new
    end
end
