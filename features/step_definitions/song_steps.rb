Given /the following songs exist/ do |songs_table|
  songs_table.hashes.each do |song|
    Song.create!(song)
  end
end

Then /(.*) seed songs should exist/ do | n_seeds |
  expect(Song.count).to eq n_seeds.to_i
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  regexp = /.*#{e1}.*#{e2}/
  expect(page.text).to match(regexp)
end

When /I (un)?check the following genres: (.*)/ do |uncheck, genre_list|
  genre_list.split(',').each do | genre | 
  genre.strip!
  if uncheck
    uncheck("genres_#{genre}")
  else
    check("genres_#{genre}")
  end
end
end

Then /^I should (not )?see the following songs: (.*)$/ do |no, song_list|
  song_list.split(',').each do | song | 
  song.strip!
  if no
    expect(page).to_not have_content(song)
    #puts "#{song} should not be visible"
  else
    expect(page).to have_content(song)
    #puts "#{song} should be visible"
  end
end
end

Then /I should see all the songs/ do
  # Make sure that all the songs are in the app 
  all_song_titles = Song.all.pluck(:title)
  all_song_titles.each do | song |
    expect(page).to have_content(song)
  end
end

Then(/^the artist of "([^"]*)" should be "([^"]*)"$/) do |song_title, artist|
  step %{I should see "#{song_title}"}
  step %{I should see "#{artist}"}
end