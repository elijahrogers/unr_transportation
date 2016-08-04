module UNRParkingZonesLogic
    def find_available_zones
      if @pass == 'Blue'
        @zones = [blue1, blue2, blue3]
      elsif @pass == 'Green'
        @zones = [green1, green2, green3, green4, green5,
                  green6, green7, green8, blue1, blue2, blue3]
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
        find_silver_zones
      elsif @pass == 'Tan'
        @zones = []
        add_green_and_blue
      elsif @pass == 'East Campus Resident'
        find_east_campus_zones
      elsif @pass == 'Evening'
        find_evening_zones
      else
        @zones = []
      end
      @zones.push(unr_outline)
    end

    private

    def find_evening_zones
      if (1530..1730).include?(@time)
        @zones = [silver17[0]]
      elsif (1730..2400).include?(@time) || (0..700).include?(@time)
        @zones = []
        add_silver
        add_green_and_blue
      else
        @zones = []
      end
    end

    def find_silver_zones
      if (0..700).include?(@time) || (1730..2400).include?(@time)
        @zones = []
        add_silver
      else
        designated_zone = "silver#{@number}"
        @zones = [*self.public_send(designated_zone)]
      end
      add_green_and_blue
    end

    def find_east_campus_zones
      if (0..700).include?(@time) || (1530..2400).include?(@time)
        @zones = [silver17[0]]
        add_green_and_blue
      else
        @zones = []
      end
    end

    def add_green_and_blue
      @zones.push(blue1, blue2, blue3, green1, green2, green3,
                  green4, green5, green6, green7, green8)
    end

    def add_silver
      @zones.push(*silver1, *silver2, *silver3, *silver5, *silver6, *silver7,
                  *silver8, *silver9, *silver10, *silver11, *silver12, *silver13,
                  *silver14, *silver15, *silver16, *silver17)
    end
end
