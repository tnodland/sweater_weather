require 'rails_helper'

RSpec.describe "account creation" do
  context "when sent an email and matching passwords" do
    it "creates a user and sends back an api key" do
      post '/api/v1/users', params: {
        "email": "example@mail.com",
        "password": "password",
        "password_confirmation": "password"
      }

      expect(response).to be_successful
      expect(response.status).to eq(201)

      json = JSON.parse(response.body)

      expect(json).to have_key("api_key")
    end

    it "doesn't get a user without proper fields" do
      post '/api/v1/users', params: {
        "password": "password",
        "password_confirmation": "password"
      }

        expect(response).to be_successful
        json = JSON.parse(response.body)

        expect(json).to have_key("invalid-request")
    end
  end
end
