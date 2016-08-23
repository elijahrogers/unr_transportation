include UNRParkingZones

module UNRParkingZonesLogic

    def find_available_zones
      if @pass == 'Blue'
        @zones = [blue1, blue2, blue3, blue4, blue5, blue6]
      elsif @pass == 'Green'
        @zones = []
        add_green_and_blue
      elsif @pass == 'Purple'
        @zones = [purple1, purple2, purple3, purple4]
      elsif @pass == 'Orange'
        @zones = [orange1]
        add_green_and_blue
      elsif @pass == 'Yellow'
        designated_zone = "yellow#{@number}"
        @zones = [self.public_send(designated_zone)]
        add_green_and_blue
        add_tan
      elsif @pass == 'Silver'
        find_silver_zones
      elsif @pass == 'Tan'
        @zones = [tan1, tan2]
        add_green_and_blue
      elsif @pass == 'East Campus Resident'
        find_east_campus_zones
      elsif @pass == 'Evening'
        find_evening_zones
      elsif @pass == 'Visitor'
        @zones = visitor_zones
      elsif @pass == 'Metered Parking'
        @zones = metered_zones
      else
        @zones = []
      end
      @zones.push(unr_outline)
    end

    def parking_pass_info
      case @pass
      when 'Blue'
        @info = blue_zone_permit
      when 'Silver'
        @info = silver_zone_permit
      when 'Tan'
        @info = tan_zone_permit
      when 'Purple'
        @info = purple_zone_permit
      when 'Green'
        @info = green_zone_permit
      when 'Orange'
        @info = orange_zone_permit
      when 'Yellow'
        if @number == '1'
          @info = yellow_1_zone_permit
        elsif @number == '2'
          @info = yellow_2_zone_permit
        elsif @number == '3'
          @info = yellow_3_zone_permit
        end
      when 'Evening'
        @info = evening_permit
      when 'East Campus Resident'
        @info = east_campus_resident_permit
      when 'Visitor'
        @info = visitor_parking
      when 'Metered Parking'
        @info = metered_parking
      else
        @info = nil
      end
    end

    private

    def find_evening_zones
      if (1530..1730).include?(@time)
        @zones = [silver17[0]]
      elsif (1730..2400).include?(@time) || (0..700).include?(@time)
        @zones = []
        add_silver
        add_tan
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
      add_tan
    end

    def find_east_campus_zones
      if (0..700).include?(@time) || (1530..2400).include?(@time)
        @zones = [silver17[0]]
        add_green_and_blue
        add_tan
      else
        @zones = []
      end
    end

    def add_green_and_blue
      @zones.push(blue1, blue2, blue3, blue4, blue5, blue6, green1, green2, green3,
                  green4, green5, green6, green7, green8)
    end

    def add_silver
      @zones.push(*silver1, *silver2, *silver3, *silver5, *silver6, *silver7,
                  *silver8, *silver9, *silver10, *silver11, *silver12, *silver13,
                  *silver14, *silver15, *silver16, *silver17)
    end

    def add_tan
      @zones.push(tan1, tan2)
    end
end
