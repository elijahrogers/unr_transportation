module ParkingPassInfo
  def silver_zone_permit
    {
      name: 'Silver Zone Permit', price: '$400', description: "Sold to Faculty, Staff and Students. These permits have a designated number on the front corresponding to a particular parking zone. <span style=\"color:#00f7ff\">Silver</span> zone permits also allow permit holders to park in <span style=\"color:#b5ae6a\">Tan</span>, <span style=\"color:#17a804\">Green 1</span> and <span style=\"color:#296bff\">Blue</span> signed zones. <span style=\"color:#00f7ff\">Silver</span> permit holders may park in any <span style=\"color:#00f7ff\">Silver</span> zone after 5:30 p.m."
    }
  end

  def tan_zone_permit
    {
      name: 'Tan Zone Permit', price: '$300', description: "Sold to Faculty, Staff and Students. These permits are valid in the <span style=\"color:#b5ae6a\">Tan</span> signed zones. <span style=\"color:#b5ae6a\">Tan</span> zone permits also allow permit holders to park in <span style=\"color:#17a804\">Green</span> and <span style=\"color:#296bff\">Blue</span> signed zones."
    }
  end

  def green_zone_permit
    {
      name: 'Green 1 Zone Permit', price: '$230', description: "Sold to Faculty, Staff and Students. These permits have a designated number on the front corresponding to a particular parking zone. <span style=\"color:#17a804\">Green 1</span> zone permits also allow permit holders to park in <span style=\"color:#296bff\">Blue</span> signed zones."
    }
  end

  def blue_zone_permit
    {
      name: 'Blue Permit', price: '$125', description: "Sold to Faculty, Staff and Students. These permits are valid in the <span style=\"color:#296bff\">Blue</span> signed zones."
    }
  end

  def yellow_1_zone_permit
    {
      name: 'Yellow 1 Zone (Dorm Area) Permit', price: '$400', description: "Sold to Dorm Residents only. These permits are available in limited quantities and are valid in the <span style=\"color:#afc400\">Yellow 1</span> zone, as well as <span style=\"color:#b5ae6a\">Tan</span>, <span style=\"color:#17a804\">Green 1</span> or <span style=\"color:#296bff\">Blue</span> zones. Parking in the <span style=\"color:#afc400\">Yellow 1</span> zone is enforced 24 hours per day, 7 days per week."
    }
  end

  def yellow_2_zone_permit
    {
      name: 'Yellow 2 Zone (Dorm Area) Permit', price: '$400', description: "Sold to Sierra Hall residents only. These permits are available in limited quantities and are valid in the <span style=\"color:#afc400\">Yellow 2</span>, <span style=\"color:#b5ae6a\">Tan</span>, <span style=\"color:#17a804\">Green 1</span> and <span style=\"color:#296bff\">Blue</span> zones."
    }
  end

  def yellow_3_zone_permit
    {
      name: 'Yellow 3 Zone Permit', price: '$400', description: "Sold to Ponderosa Village residents. These permits are available in limited quantities and are valid in the <span style=\"color:#afc400\">Yellow 3</span> zone, as well as <span style=\"color:#b5ae6a\">Tan</span>, <span style=\"color:#17a804\">Green 1</span> or <span style=\"color:#296bff\">Blue</span> signed zones."
    }
  end

  def orange_zone_permit
    {
      name: 'Orange Zone Permit', price: '$230', description: "Sold to Ponderosa Village Residents. These permits are valid in the <span style=\"color:#ed5500\">Orange</span>, <span style=\"color:#17a804\">Green 1</span> and <span style=\"color:#296bff\">Blue</span> signed zones. Please contact our office to purchase this permit."
    }
  end

  def east_campus_resident_permit
    {
      name: 'East Campus Resident Permit', price: '$125', description: "Sold to University Highlands and Republic residents only. These permits are valid in the <span style=\"color:#00f7ff\">West Stadium Parking Complex</span>, <span style=\"color:#b5ae6a\">Tan</span> , <span style=\"color:#17a804\">Green 1</span> and <span style=\"color:#296bff\">Blue</span> zones after 3:30 p.m. The permit also includes a shuttle bus access card which is required in order for residents to ride the East Campus Shuttle serving the University Highlands apartment complex."
    }
  end

  def evening_permit
    {
      name: 'Evening Permit', price: '$125', description: "Sold to Faculty, Staff and Students. These permits are valid after 3:30 p.m. and allow parking in the <span style=\"color:#00f7ff\">West Stadium Parking Complex</span>. After 5:30 p.m. evening permits are valid in <span style=\"color:#00f7ff\">Silver</span>, <span style=\"color:#b5ae6a\">Tan</span>, <span style=\"color:#17a804\">Green 1</span> and <span style=\"color:#296bff\">Blue</span> zones. This permit is not valid in any space marked 'Enforced 24/7.'"
    }
  end

  def purple_zone_permit
    {
      name: 'Purple Zone Permit' , price: 'Price Unavailable', description: "These permits are valid in <span style=\"color:#8600ee\">Purple</span> signed zones."
    }
  end

  def visitor_parking
    {
      name: 'Visitor Parking' , price: 'Price Variable', description: "Parking for visitors to UNR is available on the top level of the <span style=\"color:#FF0000\">West Stadium Parking Complex</span> for $5.00 per day. <br /><br />Visitor parking is also available on first and second levels of the <span style=\"color:#ff00d6\">Brian J. Whalen Parking Complex</span> at a rate of $1.50/hour for a maximum of 4 hours."
    }
  end

  def metered_parking
    {
      name: 'Metered Parking' , price: 'Price Variable', description: "Metered Parking is available throughout campus."
    }
  end
end
