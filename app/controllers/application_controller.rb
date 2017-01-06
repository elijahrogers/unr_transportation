class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  protect_from_forgery with: :exception
  include UNRParkingZonesLogic
  include ParkingPassInfo

  layout 'application'

  def main
    @pass = ''
    find_available_zones
  end

  def update
    update_params
    parking_pass_info
    find_available_zones
    render json: {
      pass: @pass,
      number: @number,
      time: @time,
      zones: @zones,
      info: @info
    }
  end

  def update_params
    @pass = params[:pass]
    @number = params[:number]
    @time = params[:time].delete(':').to_i
  end
end
