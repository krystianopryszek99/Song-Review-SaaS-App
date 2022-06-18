# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Seed the RottenPotatoes DB with some movies.
more_songs = [
  {:title => 'Heat Waves', :genre => 'Pop', :artist => 'Glass Animals', :album => 'Dreamland',
    :release_date => '29-Jun-2020'},
  {:title => 'As It Was', :genre => 'Pop', :artist => 'Harry Styles', :album => 'Harrys House',
    :release_date => '1-Apr-2022'},
  {:title => 'In My Head', :genre => 'HipHop', :artist => 'Lil Tjay', :album => 'In My Head',
    :release_date => '1-Apr-2022'},
  {:title => 'Better Off Alone', :genre => 'Dance', :artist => 'THAT KIND', :album => 'Better Off Alone',
    :release_date => '22-Oct-2022'},
  {:title => 'I Need A Boiler Room', :genre => 'House', :artist => 'blk', :album => 'Sounds like a good time',
    :release_date => '23-Jan-2020'},
  {:title => 'Starlight', :genre => 'Rap', :artist => 'Dave', :album => 'Starlight',
    :release_date => '3-Mar-2022'},
  {:title => 'Touch', :genre => 'Dance', :artist => 'VINAI', :album => 'Touch',
    :release_date => '18-Jun-2021'},
  {:title => 'Levitating', :genre => 'Pop', :artist => 'Dua Lipa', :album => 'Future Nostalgia',
    :release_date => '1-Oct-2020'},
  {:title => '2055', :genre => 'HipHop', :artist => 'Sleepy Hallow', :album => 'Still Sleep?',
    :release_date => '14-Apr-2021'},
  {:title => 'Rampampam', :genre => 'Dance', :artist => 'Minelli', :album => 'Rampampam Remixes',
    :release_date => '18-Mar-2021'}
]

more_songs.each do |song|
  Song.create!(song)
end