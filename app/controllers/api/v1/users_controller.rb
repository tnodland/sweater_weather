class Api::V1::UsersController < ApplicationController
  def create
    key = SecureRandom.urlsafe_base64
    user = User.create(user_params)
    user.update(api_key: key)
    if user.save
      render json: {
        "api_key": key
      }, status: 201
    else
      render json: {
        "invalid-request":{
          "error": "User was unable to be created"
        }
      }
    end
  end

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
  private
end
