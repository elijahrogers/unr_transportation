module UsersHelper
  def format_course(course)
    building = Building.find(course.building_id)
    [
      { name: course.name },
      {
        lat: building.lat.to_f,
        lng: building.lng.to_f
      }
    ]
  end
end
