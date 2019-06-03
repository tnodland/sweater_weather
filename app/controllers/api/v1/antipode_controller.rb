class Api::V1::AntipodeController < ApplicationController
  def show
    antipode = AntipodeFacade.new(params[:loc])
    render json: {
      data: AntipodeSerializer.new(antipode.get_antipode)
    }
  end
end
