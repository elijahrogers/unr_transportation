class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include UNRParkingZonesLogic

  def main
    @pass = ''
    find_available_zones
  end

  def update
    @pass = params[:pass]
    @number = params[:number]
    @time = (params[:time]).gsub(':', '').to_i
    find_available_zones
    render json:{pass: @pass, number: @number, time: @time, zones: @zones}
  end

end
