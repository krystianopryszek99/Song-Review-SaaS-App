Feature: display list of songs sorted by genre

  As a music fan
  So that I can quickly browse songs based on my prefrences
  I want to see songs sorted by title or release date

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

Scenario: sort songs alphabetically
  When I follow "Title"
  Then I should see "2055" before "Touch"

Scenario: sort songs in increasing order of release date
  When I follow "Release date"
  Then I should see "I Need A Boiler Room" before "Better Off Alone"