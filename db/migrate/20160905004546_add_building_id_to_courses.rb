class AddBuildingIdToCourses < ActiveRecord::Migration
  def up
    add_column('courses', 'building_id', :integer)
  end

  def dowm
    remove_column('courses', 'building_id')
  end
end
