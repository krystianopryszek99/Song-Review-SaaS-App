#require 'rails_helper'
#
# RSpec.describe "songs/new", type: :view do
#   before(:each) do
#     assign(:song, Song.new(
#       :title => "MyString",
#       :genre => "MyString",
#       :artist => "MyString",
#       :album => "MyString",
#       :description => "MyString",
#       :release_date => "MyString"
#     ))
#   end

#   it "renders new song form" do
#     render

#     assert_select "form[action=?][method=?]", songs_path, "post" do

#       assert_select "input#song_title[name=?]", "song[title]"

#       assert_select "input#song_genre[name=?]", "song[genre]"

#       assert_select "input#song_artist[name=?]", "song[artist]"

#       assert_select "input#song_album[name=?]", "song[album]"

#       assert_select "input#song_description[name=?]", "song[description]"

#       assert_select "input#song_release_date[name=?]", "song[release_date]"
#     end
#   end
# end
