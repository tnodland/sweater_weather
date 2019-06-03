class AntipodeSerializer
  def initialize(data, first_location)
    @data = data
    @first_location = first_location
  end

  def format_data
    service = GoogleService.new
    antipode_city = service.get_city(@data[:latitude], @data[:longitude])
    data = @data[:currently]
    return [
      {
        "id": 1,
        "type": "antipode",
        "attributes": {
          "location_name": "#{antipode_city}",
          "forecast": {
            "summary": "#{data[:summary]}",
            "current_temperature": "#{data[:temperature]}",
          },
          "search_location": "#{@first_location}"
        }
      }
    ]
  end
end
