require 'rails_helper'

RSpec.describe 'getting weather of an antipode' do
  it "can get the weather and antipode based off of a city" do
    get '/api/v1/antipode?loc=hongkong'

    expect(response).to be_successful
  
    parsed_data = JSON.parse(response.body)
    expect(parsed_data).to have_key("data")
    expect(parsed_data["data"][0]).to be_a(Hash)
    expect(parsed_data["data"][0]).to have_key("id")
    expect(parsed_data["data"][0]).to have_key("type")
    expect(parsed_data["data"][0]["attributes"]).to be_a(Hash)
    expect(parsed_data["data"][0]["attributes"]).to have_key("location_name")
    expect(parsed_data["data"][0]["attributes"]).to have_key("forecast")
    expect(parsed_data["data"][0]["attributes"]).to have_key("search_location")
  end
end
