require 'rails_helper'

RSpec.describe "user favorite cities" do
  context "when sent a city and valid api key" do
    it "saves the favorite" do
      user = User.create(email: "test@mail.com", password: "password", api_key: "key")

      post '/api/v1/favorites', params: {
        "location": "Denver, CO",
        "api_key": "key"
      }

      expect(response).to be_successful
      favorite = Favorite.last

      expect(favorite.user_id).to eq(user.id)
    end
  end

  context "invalid keys return a 401" do
    it "missing key" do
      post '/api/v1/favorites', params: {
        "location": "Denver, CO"}

      expect(response.status).to eq(401)
    end

    it "invalid/non-existant key" do
      user = User.create(email: "test@mail.com", password: "password", api_key: "key")

      post '/api/v1/favorites', params: {
        "location": "Denver, CO",
        "api_key": "key2"
      }

      expect(response.status).to eq(401)
    end
  end

  context "removing favorite locations" do
    it "can remove a favorite" do
      user = User.create(email: "test@mail.com", password: "password", api_key: "key")
      user.favorites.create(city: "Denver, CO")

       delete '/api/v1/favorites', params: {
         "location": "Denver, CO",
         "api_key": "key"
       }

       expect(response).to be_successful
       expect(Favorite.all).to eq([])
    end

    it "can't remove a favorite with the wrong key" do
      user = User.create(email: "test@mail.com", password: "password", api_key: "key")

       delete '/api/v1/favorites', params: {
         "location": "Denver, CO",
         "api_key": "key2"
       }

       expect(response.status).to eq(401)
    end

    it "cant remove a favorite for the wrong user" do
      user = User.create(email: "test@mail.com", password: "password", api_key: "key")
      user2 = User.create(email: "test2@mail.com", password: "password", api_key: "key2")
      user.favorites.create(city: "Denver, CO")

       delete '/api/v1/favorites', params: {
         "location": "Denver, CO",
         "api_key": "key2"
       }

       expect(response.status).to eq(401)
    end
  end

  context "favorites for a user" do
    it "can get all favorites from an api key" do
      user = User.create(email: "test@mail.com", password: "password", api_key: "key")
      user.favorites.create(city: "Denver, CO")
      user.favorites.create(city: "Pueblo, CO")

      get '/api/v1/favorites', params: {
        "api_key": "key"
      }

      expect(response).to be_successful

      json = JSON.parse(response.body)

      expect(json).to be_a(Array)
      expect(json[0]).to have_key("location")
      expect(json[1]).to have_key("location")
    end

    it "gets a 401 without an api key" do
      user = User.create(email: "test@mail.com", password: "password", api_key: "key")
      
      get '/api/v1/favorites', params: {
        "api_key": "key2"
      }

      expect(response.status).to eq(401)
    end
  end
end
