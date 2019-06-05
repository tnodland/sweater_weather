class AntipodeSerializer
  def initialize(data, first_location)
    @data = data
    @first_location = first_location
  end

  def format_data
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

  def antipode_city
    service = GoogleService.new
    service.get_city(@data[:latitude], @data[:longitude])
  end
end
