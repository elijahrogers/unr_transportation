module Common
  def format_errors(obj)
    flash[:danger] = 'The following errors were found: '
    flash[:danger] += obj.errors.full_messages.to_sentence.downcase
  end

  def format_course(course)
    building = course.building
    [
      { name: course.name },
      {
        lat: building.lat.to_f,
        lng: building.lng.to_f
      }
    ]
  end
end
