class AmypodeService
  def get_poded(coords)
    response = get_response(coords[:lat], coords[:lng])
    JSON.parse(response.body, symbolize_names: true)
  end

  private

    def conn
      @_conn ||= Faraday.new("http://amypode.herokuapp.com/api/v1/") do |f|
                  f.adapter Faraday.default_adapter
                end
    end

    def get_response(lat,long)
      conn.get("antipodes?lat=#{lat}&long=#{long}") do |req|
        req.headers['api-key'] = ENV['AMYPODE-API-KEY']
      end
    end
end
