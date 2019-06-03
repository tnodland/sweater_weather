class Api::V1::ForecastController < ApplicationController
  def show
    forecast = ForecastFacade.new(params[:location])
    render json: {
      image: forecast.image,
      current: forecast.current_weather,
      hourly: forecast.hourly_weather,
      daily: forecast.daily_weather
    }
  end
end
