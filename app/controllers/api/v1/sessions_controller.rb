class Api::V1::SessionsController < ApplicationController
  def create
    if User.find_by(email: params[:email])
      user = User.find_by(email: params[:email])
      if user.authenticate(params[:password])
        render json: {
          "api_key": user.api_key
          }, status: 200
      end
    else
      render json: {
        "error": "User not found"
      }
    end
  end
end
