#require 'rails_helper'
#
# RSpec.describe "songs/index", type: :view do
#   before(:each) do
#     assign(:songs, [
#       Song.create!(
#         :title => "Title",
#         :genre => "Genre",
#         :artist => "Artist",
#         :album => "Album",
#         :description => "Description",
#         :release_date => "Release Date"
#       ),
#       Song.create!(
#         :title => "Title",
#         :genre => "Genre",
#         :artist => "Artist",
#         :album => "Album",
#         :description => "Description",
#         :release_date => "Release Date"
#       )
#     ])
#   end

#   it "renders a list of songs" do
#     render
#     assert_select "tr>td", :text => "Title".to_s, :count => 2
#     assert_select "tr>td", :text => "Genre".to_s, :count => 2
#     assert_select "tr>td", :text => "Artist".to_s, :count => 2
#     assert_select "tr>td", :text => "Album".to_s, :count => 2
#     assert_select "tr>td", :text => "Description".to_s, :count => 2
#     assert_select "tr>td", :text => "Release Date".to_s, :count => 2
#   end
# end
