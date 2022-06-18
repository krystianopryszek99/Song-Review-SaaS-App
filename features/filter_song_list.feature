Feature: display list of songs filtered by genre

  As a music fan
  So that I can quickly browse songs appropriate for me
  I want to see songs matching only certain genres

Background: songs have been added to database

  Given the following songs exist:
  | title                   | genre   | artist        | album                   | release_date |
  | Heat Waves              | Pop     | Glass Animals | Dreamland               | 29-Jun-2020  |
  | As It Was               | Pop     | Harry Styles  | Harrys House            | 1-Apr-2022   |
  | In My Head              | HipHop  | Lil Tjay      | In My Head              | 1-Apr-2022   |
  | Better Off Alone        | Dance   | THAT KIND     | Better Off Alone        | 22-Oct-2022  |
  | I Need A Boiler Room    | House   | blk           | Sounds like a good time | 23-Jan-2020  |
  | Starlight               | Rap     | Dave          | Starlight               | 3-Mar-2022   |
  | Touch                   | Dance   | VINAI         | Touch                   | 18-Jun-2021  |
  | Levitating              | Pop     | Dua Lipa      | Future Nostalgia        | 1-Oct-2020   |
  | 2055                    | HipHop  | Sleepy Hallow | Still sleep             | 14-Apr-2021  |
  | Rampampam               | Dance   | Minelli       | Rampampam Remixes       | 18-Mar-2021  |

  And  I am on the home page
  Then 10 seed songs should exist 

Scenario: restrict to songs with "Pop" or "Dance" genres
  When I check the following genres: Pop, Dance
  And I uncheck the following genres: HipHop, House, Rap
  And I press "Refresh"
  Then I should see the following songs: Heat Waves, As It Was, Levitating, Better Off Alone, Touch, Rampampam
  And I should not see the following songs: In My Head, 2055, I Need A Boiler Room, Starlight

Scenario: all genres selected
  When I check the following genres: Pop, Dance, HipHop, House, Rap
  And I press "Refresh"
  Then I should see all the songs
