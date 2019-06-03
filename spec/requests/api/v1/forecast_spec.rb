require 'rails_helper'

RSpec.describe 'getting forecasts' do
  it "can send forecast data" do

    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful
  end
end
