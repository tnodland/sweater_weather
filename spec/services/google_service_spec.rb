require 'rails_helper'

RSpec.describe GoogleService do
  it "can return lat and long from a location" do
    service = GoogleService.new

    response = service.get_coords("denver,co")
    # binding.pry
    expect(response).to be_a(Hash)
    expect(response).to have_key(:lat)
    expect(response).to have_key(:lng)
  end
end
