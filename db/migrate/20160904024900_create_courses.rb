class CreateCourses < ActiveRecord::Migration
  def up
    create_table :courses do |t|
      t.belongs_to :user, index: true
      t.string 'name', limit: 50
      t.timestamps null: false
    end
  end

  def down
    drop_table :courses
  end
end
