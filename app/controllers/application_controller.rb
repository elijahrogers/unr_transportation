class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include ParkingZones

  def main
  end

  def update
    @pass = params[:pass]
    @date = params[:date]
    find_available_zones
  end

  def find_available_zones
    if @pass == 'Blue'
      @zones = [blue1, blue2, unr_outline]
    else
      @zones = [unr_outline]
    end
  end

end
