require 'rails_helper'

RSpec.describe GoogleService do
  it "can return lat and long from a location" do
    service = GoogleService.new

    response = service.get_coords("denver,co")

    expect(response).to be_a(Hash)
    expect(response).to have_key(:lat)
    expect(response).to have_key(:lng)
  end

  it "can return a location from lat and long" do
    service = GoogleService.new
    lat = 39
    long = -104

    response = service.get_city(lat, long)

    expect(response).to be_a(String)
  end
end
