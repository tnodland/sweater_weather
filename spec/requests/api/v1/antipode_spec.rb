require 'rails_helper'

RSpec.describe 'getting weather of an antipode' do
  it "can get the weather and antipode based off of a city" do
    get '/api/v1/antipode?loc=hongkong'

    expect(response).to be_successful
    
    expect(JSON.parse(response.body)).to have_key("data")

  end
end
