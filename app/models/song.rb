class Song < ActiveRecord::Base
  def self.all_genres
   ['Pop', 'HipHop', 'Rap', 'Dance', 'House']
  end

  def self.with_genres(genres, sort_by)
   Song.where(genre: genres).order(sort_by)
  end

  def search_same_artist
   Song.where(artist: artist)
  end

end