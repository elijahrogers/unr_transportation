class AddDbIndexToCourses < ActiveRecord::Migration
  def up
    add_index :courses, :building_id
  end

  def down
    remove_index :courses, :building_id
  end
end
