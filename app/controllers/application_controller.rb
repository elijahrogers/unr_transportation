class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include UNRParkingZonesLogic
  include ParkingPassInfo

  def main
    @pass = ''
    find_available_zones
  end

  def update
    @pass = params[:pass]
    @number = params[:number]
    @time = (params[:time]).gsub(':', '').to_i
    parking_pass_info
    find_available_zones
    render json:{pass: @pass, number: @number, time: @time, zones: @zones, info: @info}
  end
end
