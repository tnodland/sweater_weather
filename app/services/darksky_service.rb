class DarkskyService
  def location_forecast(lat, long)
    conn = Faraday.new("https://api.darksky.net/forecast/#{ENV['DARKSKY-API-KEY']}/") do |f|
      f.adapter Faraday.default_adapter
    end

    response = conn.get("#{lat},#{long}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
