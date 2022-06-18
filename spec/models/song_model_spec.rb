require 'spec_helper'

describe Song, type: :model do

  # same artist
  context 'search same artist' do
    it 'should find songs with same artist' do
      song1 = Song.create!(artist: "Dave")
      song2 = Song.create!(artist: "Dave")
      song1.search_same_artist.should include(song2)
    end

    it 'should not find songs with different artist' do
      song1 = Song.create!(artist: "Dave")
      song2 = Song.create!(artist: "Eminem")
      song1.search_same_artist.should_not include(song2)
    end
  end

  # find all songs genres 
  context 'find all songs genres' do
    it 'should find all genres' do
     expect(Song.all_genres).to match(['Pop', 'HipHop', 'Rap', 'Dance', 'House'])
    end
 
    it 'should not find all genres' do
     expect(Song.all_genres).not_to match(['Techno', 'Jazz', 'Rock'])
    end
   end
end 