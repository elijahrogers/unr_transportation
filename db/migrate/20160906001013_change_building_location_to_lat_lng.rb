class ChangeBuildingLocationToLatLng < ActiveRecord::Migration
  def up
    remove_column('buildings', 'location')
    add_column('buildings', 'lat', :decimal)
    add_column('buildings', 'lng', :decimal)
  end

  def down
    remove_column('buildings', 'lng')
    remove_column('buildings', 'lat')
    add_column('buildings', 'location', :string)
  end
end
