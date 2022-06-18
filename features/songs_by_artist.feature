Feature: search for songs by artist

  As as like songs by Dave
  So that I can find his songs 
  I want to see all songs by him

Background: songs in database

  Given the following songs exist:
  | title                   | genre   | artist        | album                            | release_date |
  | Heat Waves              | Pop     | Glass Animals | Dreamland                        | 29-Jun-2020  |
  | Verdansk                | Rap     | Dave          | We're All Alone in This Together | 9-Jul-2021   |
  | In My Head              | HipHop  | Lil Tjay      | In My Head                       | 1-Apr-2022   |
  | Better Off Alone        | Dance   | THAT KIND     | Better Off Alone                 | 22-Oct-2022  |
  | I Need A Boiler Room    | House   | blk           | Sounds like a good time          | 23-Jan-2020  |
  | Starlight               | Rap     | Dave          | Starlight                        | 3-Mar-2022   |
  | Touch                   | Dance   | VINAI         | Touch                            | 18-Jun-2021  |
  | Levitating              | Pop     | Dua Lipa      | Future Nostalgia                 | 1-Oct-2020   |
  | Shivers                 | Pop     |               | =                                | 10-Sep-2021  |
  | Rampampam               | Dance   | Minelli       | Rampampam Remixes                | 18-Mar-2021  |

  And  I am on the home page
  And 10 seed songs should exist
  Then I should see "Dave"

Scenario: add artist to existing song
  When I go to the edit page for "Shivers" 
  And  I fill in "Artist" with "Ed Sheeran"
  And  I press "Update Changes"
  Then the artist of "Shivers" should be "Ed Sheeran"

Scenario: add artist to new song
  When I go to the new song page
  And I fill in "Title" with "Clash"
  And I fill in "Artist" with "Dave"
  Then I fill in "Album" with "We're All Alone in This Together"
  And I press "Save Changes"
  
Scenario: find song with same artist
  Given I am on the details page for "Starlight"
  When  I follow "Find Songs With Same Artist"
  Then  I should be on the Similar Songs page for "Starlight"
  But   I should not see "Touch"

Scenario: can't find similar songs if we don't know artist (sad path)
  Given I am on the details page for "Shivers"
  Then  I should not see "Ed Sheeran"
  When  I follow "Find Songs With Same Artist"
  Then  I should be on the home page
  And   I should see "'Shivers' has no artist info"