# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
buildings = [
  { name: 'Agricultural Education Building', abr: 'AE' , lat: 39.537888, lng: -119.807149 },
  { name: 'Anderson Health Science', abr: 'AHS', lat: 39.549256, lng: -119.816918 },
  { name: 'Ansari Business Building', abr: 'AB', lat: 39.540054, lng: -119.814702 },
  { name: 'Applied Research Facility', abr: 'ARF', lat: 39.544518, lng: -119.814758 },
  { name: 'Artemesia Building', abr: 'ARTM', lat: 39.538534, lng: -119.818008 },
  { name: 'Center for Molecular Medicine', abr: 'CMM', lat: 39.550102, lng: -119.815993 },
  { name: 'Chemistry Building', abr: 'CB', lat: 39.540644, lng: -119.814325 },
  { name: 'Church Fine Arts', abr: 'CFA', lat: 39.5412425545764, lng: -119.8168797791 },
  { name: 'Computer Center', abr: 'CC', lat: 39.5470662501037, lng: -119.819357469677 },
  { name: 'Continuing Education', abr: 'CE', lat: 39.5376126411457, lng: -119.817006513476 },
  { name: 'Davidson Math and Science Center', abr: 'DMSC', lat: 39.539005, lng: -119.812382 },
  { name: 'Department of Pediatrics', abr: 'PDO', lat: 39.547724, lng: -119.816379 },
  { name: 'Earthquake Engineering Laboratory', abr: 'EEL', lat: 39.540486, lng: -119.812517 },
  { name: 'Edmund J. Cain Hall', abr: 'EJCH', lat: 39.5420016641612, lng: -119.814119786024 },
  { name: 'Environmental Research Facility', abr: 'ERF', lat: 39.5478481844327, lng: -119.819477163255 },
  { name: 'Equestrian Center', abr: 'EC', lat: 39.541066, lng: -119.807503 },
  { name: 'Family Medicine Center', abr: 'FMC', lat: 39.5483720658595, lng: -119.816584736108 },
  { name: 'Fleischmann Agriculture', abr: 'FA', lat: 39.5376945552139, lng: -119.812079966068 },
  { name: 'Fleischmann Planetarium and Science Center', abr: 'FP', lat: 39.5458399701649, lng: -119.819177091121 },
  { name: 'Frandsen Humanities', abr: 'FH', lat: 39.5383342813476, lng: -119.815200716257 },
  { name: 'Harry Reid Engineering Laboratory', abr: 'HREL', lat: 39.5405413533322, lng: -119.813320487737 },
  { name: 'Howard Medical Sciences', abr: 'HMS', lat: 39.5491613620292, lng: -119.81548435986 },
  { name: 'Jones Center', abr: 'JC', lat: 39.5383073906283, lng: -119.814610630273 },
  { name: 'Jot Travis Building', abr: 'JT', lat: 39.5386300785728, lng: -119.816557914018 },
  { name: 'Knudtsen Resource Center', abr: 'KRC', lat: 39.538671, lng: -119.807024 },
  { name: 'Legacy Hall', abr: 'LEGH', lat: 39.5454323084488, lng: -119.81729619205 },
  { name: 'Leifson Physics', abr: 'LP', lat: 39.5410357112882, lng: -119.814186841249 },
  { name: 'Life Science', abr: 'LS', lat: 39.53829, lng: -119.81245 },
  { name: 'Lombardi Recreation Center', abr: 'LR', lat: 39.5458441067504, lng: -119.815706312656 },
  { name: 'Mack Social Science', abr: 'MSS', lat: 39.5404689575201, lng: -119.815114885568 },
  { name: 'Mackay Mines', abr: 'MM', lat: 39.5392526965849, lng: -119.814414829015 },
  { name: 'Mackay Science', abr: 'MS', lat: 39.5381729368753, lng: -119.813709408044 },
  { name: 'Manville Health Science', abr: 'MHS', lat: 39.5496770987045, lng: -119.8162253201 },
  { name: 'Marguerite W. Petersen Athletic Academic Center', abr: 'MWPB', lat: 39.545575, lng: -119.816862 },
  { name: 'Morrill Hall', abr: 'MH', lat: 39.5376165024207, lng: -119.813899844884 },
  { name: 'National Judicial College', abr: 'NJC', lat: 39.5429407146657, lng: -119.813907891511 },
  { name: 'Nellor Biomedical Sciences', abr: 'NBS', lat: 39.5497507947515, lng: -119.816628322005 },
  { name: 'Nevada Living Learning Community', abr: 'NLLC', lat: 39.540366, lng: -119.817753 },
  { name: 'Nevada State Health Laboratory', abr: 'NSHL', lat: 39.5489340671737, lng: -119.818007647991 },
  { name: 'Orvis Building', abr: 'OB', lat: 39.5380695107342, lng: -119.812923520803 },
  { name: 'Palmer Engineering', abr: 'PE', lat: 39.5394326549035, lng: -119.813033491373 },
  { name: 'Paul Laxalt Mineral Engineering', abr: 'LME', lat: 39.539055, lng: -119.813702 },
  { name: 'Paul Laxalt Mineral Research', abr: 'LMR', lat: 39.538703, lng: -119.813235 },
  { name: 'Pennington Medical Education', abr: 'PMB', lat: 39.5485948814543, lng: -119.815877974033 },
  { name: 'Reynolds School of Journalism', abr: 'RSJ', lat: 39.5412239387057, lng: -119.81521949172 },
  { name: 'Ross Hall', abr: 'RH', lat: 39.5385949139337, lng: -119.814653545618 },
  { name: 'Sarah H. Fleischmann Building', abr: 'SFB', lat: 39.537454, lng: -119.813196 },
  { name: 'Savitt Medical Science', abr: 'SMS', lat: 39.5488594050809, lng: -119.816388264298 },
  { name: 'Schulich Lecture Hall', abr: 'SLH', lat: 39.5408619624498, lng: -119.814567714929 },
  { name: 'Scrugham Engineering and Mines', abr: 'SEM', lat: 39.5397015572686, lng: -119.813374131917 },
  { name: 'Sports Medicine Complex', abr: 'SMC', lat: 39.546212, lng: -119.815993 },
  { name: 'Thompson Building', abr: 'TB', lat: 39.5390210254189, lng: -119.815248996019 },
  { name: 'Virginia Street Gym', abr: 'VSG', lat: 39.5402104004317, lng: -119.816584736108 },
  { name: 'William J. Raggio', abr: 'WRB', lat: 39.5420223482299, lng: -119.815093427896 },
  { name: 'William N. Pennington Health Sciences Education', abr: 'PHS', lat: 39.5491585354935, lng: -119.813697338104 }
]

buildings.each do |building|
  Building.create( name: building[:name], abbreviation: building[:abr], lat: building[:lat], lng: building[:lng])
end
