class AmypodeService
  def get_poded(coords)
    conn = Faraday.new("http://amypode.herokuapp.com/api/v1/") do |f|
      f.adapter Faraday.default_adapter
    end
    binding.pry
    lat =

    response = conn.get("")
  end
end
