class FlikrService
  def get_image(location)
    conn = Faraday.new('https://api.flickr.com') do |f|
      f.adapter Faraday.default_adapter
    end

    response = conn.get('/services/rest/') do |req|
      req.params[:method] = 'flickr.photos.search'
      req.params[:api_key] = ENV['FLIKR-API-KEY']
      req.params[:tags] = 'snow,clouds,sun,lake,nature,winter,trees'
      req.params[:format] = 'json'
      req.params[:media] = 'photos'
      req.params[:extras] = 'url_l'
      req.params[:lat] = location[:lat]
      req.params[:lon] = location[:lng]
      req.params[:accuracy] = 11
      req.params[:safe_search] = 1
      req.params[:page] = 1
      req.params[:per_page] = 1
      req.params[:content_type] = 1
      req.params[:nojsoncallback] = 1
    end

    parsed = JSON.parse(response.body, symbolize_names: true)
    return parsed[:photos][:photo][0][:url_l]
  end
end
