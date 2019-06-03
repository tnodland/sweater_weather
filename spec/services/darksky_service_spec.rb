require 'rails_helper'

RSpec.describe DarkskyService do
  it "can get data from lat and long" do
    service = DarkskyService.new

    response = service.location_forecast("37.8267","-122.4233")

    expect(response).to be_a(Hash)
    expect(response).to have_key(:currently)
    expect(response).to have_key(:hourly)
    expect(response).to have_key(:daily)
  end
end
