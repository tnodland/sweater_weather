class Api::V1::AntipodeController < ApplicationController
  def show
    antipode = AntipodeFacade.new(params[:loc])
    serializer = AntipodeSerializer.new(antipode.get_antipode, params[:loc])
    render json: {
      data: serializer.format_data
    }
  end
end
