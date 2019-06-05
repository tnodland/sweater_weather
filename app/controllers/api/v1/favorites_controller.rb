class Api::V1::FavoritesController < ApplicationController
  def index
    if User.find_by(api_key: params[:api_key])
      user = User.find_by(api_key: params[:api_key])
      facade = FavoritesFacade.new(user.favorites)
      render json: facade.favorites
    else
      render json: {
        "error": "invalid api key"
      }, status: 401
    end
  end

  def create
    if User.find_by(api_key: params[:api_key])
      user = User.find_by(api_key: params[:api_key])
      user.favorites.create(city: params[:location])
    else
      render json: {
        "error": "invalid api key"
      }, status: 401
    end
  end

  def destroy
    if User.find_by(api_key: params[:api_key])
      user = User.find_by(api_key: params[:api_key])
      favorite = Favorite.find_by(city: params[:location])

      if favorite.user == user
        favorite.destroy
      else
        render json: {
          "error": "invalid user"
        }, status: 401
      end
    else
      render json: {
        "error": "invalid api key"
      }, status: 401
    end
  end
end
