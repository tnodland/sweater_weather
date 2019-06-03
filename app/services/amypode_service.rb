class AmypodeService
  def get_poded(coords)
    conn = Faraday.new("http://amypode.herokuapp.com/api/v1/") do |f|
      f.adapter Faraday.default_adapter
    end

    lat = coords[:lat]
    long = coords[:lng]

    response = conn.get("antipodes?lat=#{lat}&long=#{long}") do |req|
      req.headers['api-key'] = ENV['AMYPODE-API-KEY']
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
