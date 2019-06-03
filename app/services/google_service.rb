class GoogleService
  def get_coords(location)
    conn = Faraday.new("https://maps.googleapis.com/maps/api/") do |f|
      f.adapter Faraday.default_adapter
      f.params[:key] = ENV['GOOGLE-API-KEY']
    end

    response = conn.get("geocode/json") do |req|
      req.params[:address] = location
    end

    json = JSON.parse(response.body, symbolize_names: true)
    return json[:results][0][:geometry][:location]
  end
end
