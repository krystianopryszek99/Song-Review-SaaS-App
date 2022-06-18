class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string 'title'
      t.string 'genre'
      t.string 'artist'
      t.string 'album'
      t.text 'description'
      t.datetime 'release_date'
      t.timestamps
    end
  end
end
