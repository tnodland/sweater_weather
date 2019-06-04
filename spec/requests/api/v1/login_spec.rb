require 'rails_helper'

RSpec.describe "logging in a user" do
  context "when sent a user that exists in the database" do
    it "can fetch and return that users api key" do
      post '/api/v1/users', params: {
        "email": "example@mail.com",
        "password": "password",
        "password_confirmation": "password"
      }

      post '/api/v1/sessions', params: {
        "email": "example@mail.com",
        "password": "password"}

      expect(response).to be_successful
      expect(response.status).to eq(200)

      json = JSON.parse(response.body)

      expect(json).to have_key("api_key")
    end
  end

  context "when sent an invalid user" do
    it "returns a message" do
      post '/api/v1/sessions', params: {
        "email": "example@mail.com",
        "password": "password"}

      expect(response).to be_successful

      json = JSON.parse(response.body)

      expect(json).to have_key("error")
    end
  end
end
