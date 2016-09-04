# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
buildings = [
  { name: 'Agricultural Education Building', abr: 'AE' , loc: '{lat: 39.537888, lng:  -119.807149}'},
  { name: 'Anderson Health Science', abr: 'AHS', loc: '{lat: 39.549256, lng: -119.816918}' },
  { name: 'Ansari Business Building', abr: 'AB', loc: '{lat: 39.540054, lng: -119.814702}'},
  { name: 'Applied Research Facility', abr: 'ARF', loc: '{lat: 39.544518, lng: -119.814758}'},
  { name: 'Artemesia Building', abr: 'ARTM', loc: '{lat: 39.538534, lng: -119.818008}'},
  { name: 'Center for Molecular Medicine', abr: 'CMM', loc: '{lat: 39.550102, lng: -119.815993}'},
]

buildings.each do |building|
  Building.create( name: building[:name], abbreviation: building[:abv], location: building[:loc])
end
