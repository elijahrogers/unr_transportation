class CreateBuildings < ActiveRecord::Migration
  def up
    create_table :buildings do |t|
      t.string 'name'
      t.string 'abbreviation'
      t.string 'location'
      t.timestamps null: false
    end
  end

  def down
    drop_table :buildings
  end
end
