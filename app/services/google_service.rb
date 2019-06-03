class GoogleService
  def get_coords(location)
    response = conn.get("geocode/json") do |req|
      req.params[:address] = location
    end

    json = JSON.parse(response.body, symbolize_names: true)
    return json[:results][0][:geometry][:location]
  end

  def get_city(lat, long)
    response = conn.get("geocode/json") do |req|
      req.params[:latlng] = "#{lat},#{long}"
    end

    json = JSON.parse(response.body, symbolize_names: true)
    return json[:results][0][:address_components][1][:long_name]
  end

  private
    def conn
      Faraday.new("https://maps.googleapis.com/maps/api/") do |f|
        f.adapter Faraday.default_adapter
        f.params[:key] = ENV['GOOGLE-API-KEY']
      end
    end
end
