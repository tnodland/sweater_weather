class AntipodeFacade
  def initialize(location)
    @location = location
  end

  def get_antipode
    google_service = GoogleService.new
    amypode_service = AmypodeService.new
    darksky_service = DarkskyService.new
    pode = google_service.get_coords(@location)
    antipode = amypode_service.get_poded(pode)
    antipode_lat = antipode[:data][:attributes][:lat]
    antipode_long = antipode[:data][:attributes][:long]
    weather = darksky_service.location_forecast(antipode_lat, antipode_long)
  end
end
