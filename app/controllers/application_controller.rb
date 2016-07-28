class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include ParkingZones

  def main
  end

  def update
    @pass = params[:pass]
    @number = params[:number]
    @date = params[:date]
    @time = (params[:time]).gsub(':', '').to_i
    find_available_zones
  end

  def find_available_zones
    if @pass == 'Blue'
      @zones = [blue1, blue2, blue3]
    elsif @pass == 'Green'
      @zones = [green1, green2, green3, green4, green5, green6, green7, green8]
      @zones.push(blue1, blue2, blue3)
    elsif @pass == 'Purple'
      @zones = [purple1, purple2, purple3, purple4]
    elsif @pass == 'Orange'
      @zones = [orange1]
      add_green_and_blue
    elsif @pass == 'Yellow'
      designated_zone = "yellow#{@number}"
      @zones = [self.public_send(designated_zone)]
      add_green_and_blue
    elsif @pass == 'Silver'
      if (0..700).include?(@time) || (1730..2400).include?(@time)
        @zones = [
          *silver1, *silver2, *silver3, *silver5, *silver6, *silver7,
          *silver8, *silver9, *silver10, *silver11, *silver12, *silver13,
          *silver14, *silver15, *silver16, *silver17
        ]
      else
        designated_zone = "silver#{@number}"
        @zones = [*self.public_send(designated_zone)]
      end
      add_green_and_blue
    elsif @pass == 'Tan'
      @zones = []
      add_green_and_blue
    elsif @pass == 'East Campus Resident'
      if (0..700).include?(@time) || (1530..2400).include?(@time)
        @zones = [silver17[0]]
        add_green_and_blue
      else
        @zones = []
      end
    elsif @pass == 'Evening'
      if (1530..1730).include?(@time)
        @zones = [silver17[0]]
      elsif (1730..2400).include?(@time) || (0..700).include?(@time)
        @zones = [
          *silver1, *silver2, *silver3, *silver5, *silver6, *silver7,
          *silver8, *silver9, *silver10, *silver11, *silver12, *silver13,
          *silver14, *silver15, *silver16, *silver17
        ]
        add_green_and_blue
      else
        @zones = []
      end
    else
      @zones = []
    end
    @zones.push(unr_outline)
  end

  def add_green_and_blue
    @zones.push(blue1, blue2, blue3)
    @zones.push(green1, green2, green3, green4, green5, green6, green7, green8)
  end

end
