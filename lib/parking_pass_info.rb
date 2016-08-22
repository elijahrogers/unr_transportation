module ParkingPassInfo
  def silver_zone_permit
    {
      name: 'Silver Zone Permit', price: '$400', description: 'Sold to Faculty, Staff and Students. These permits have a designated number on the front corresponding to a particular parking zone. Silver zone permits also allow permit holders to park in Tan, Green 1 and Blue signed zones. Silver permit holders may park in any Silver zone after 5:30 p.m.'
    }
  end

  def tan_zone_permit
    {
      name: 'Tan Zone Permit', price: '$300', description: 'Sold to Faculty, Staff and Students. These permits are valid in the Tan signed zones. Tan zone permits also allow permit holders to park in Green and Blue signed zones.'
    }
  end

  def green_zone_permit
    {
      name: 'Green 1 Zone Permit', price: '$230', description: 'Sold to Faculty, Staff and Students. These permits have a designated number on the front corresponding to a particular parking zone. Green 1 zone permits also allow permit holders to park in Blue signed zones.'
    }
  end

  def blue_zone_permit
    {
      name: 'Blue Permit', price: '$125', description: 'Sold to Faculty, Staff and Students. These permits are valid in the Blue signed zones.'
    }
  end

  def yellow_1_zone_permit
    {
      name: 'Yellow 1 Zone (Dorm Area) Permit', price: '$400', description: 'Sold to Dorm Residents only. These permits are available in limited quantities and are valid in the Yellow 1 zone, as well as Tan, Green 1 or Blue zones. Parking in the Yellow 1 zone is enforced 24 hours per day, 7 days per week.'
    }
  end

  def yellow_2_zone_permit
    {
      name: 'Yellow 2 Zone (Dorm Area) Permit', price: '$400', description: 'Sold to Sierra Hall residents only. These permits are available in limited quantities and are valid in the Yellow 2, Tan, Green 1 and Blue zones.'
    }
  end

  def yellow_3_zone_permit
    {
      name: 'Yellow 3 Zone Permit', price: '$400', description: 'Sold to Ponderosa Village residents. These permits are available in limited quantities and are valid in the Yellow 3 zone, as well as Tan, Green 1 or Blue signed zones.'
    }
  end

  def orange_zone_permit
    {
      name: 'Orange Zone Permit', price: '$230', description: 'Sold to Ponderosa Village Residents. These permits are valid in the Orange, Green 1 and Blue signed zones. Please contact our office to purchase this permit.'
    }
  end

  def east_campus_resident_permit
    {
      name: 'East Campus Resident Permit', price: '$125', description: 'Sold to University Highlands and Republic residents only. These permits are valid in the West Stadium Parking Complex, Tan ,Green 1 and Blue zones after 3:30 p.m. The permit also includes a shuttle bus access card which is required in order for residents to ride the East Campus Shuttle serving the University Highlands apartment complex.'
    }
  end

  def evening_permit
    {
      name: 'Evening Permit', price: '$125', description: 'Sold to Faculty, Staff and Students. These permits are valid after 3:30 p.m. and allow parking in the West Stadium Parking Complex. After 5:30 p.m. evening permits are valid in Silver, Tan, Green 1 and Blue zones. This permit is not valid in any space marked "Enforced 24/7."'
    }
  end

  def purple_zone_permit
    {
      name: 'Purple Zone Permit' , price: 'Price Unavailable', description: 'We have no information for this pass'
    }
  end

  def visitor_parking
    {
      name: 'Visitor Parking' , price: 'Price Variable', description: "Parking for visitors to UNR is available on the top level of the <span style=\"color:#FF0000\">West Stadium Parking Complex</span> for $5.00 per day. <br /><br />Visitor parking is also available on first and second levels of the <span style=\"color:#ff00d6\">Brian J. Whalen Parking Complex</span> at a rate of $1.50/hour for a maximum of 4 hours."
    }
  end
end
