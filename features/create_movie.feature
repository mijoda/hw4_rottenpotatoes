Feature: Create new movies
 
  As a person with too much time on my hands
  So that I can expand the movie DB
  I want to be able to create new movies.

Background: movies have been added to database
  
  # NOTE: No directors (they'll just be nil)
  Given the following movies exist:
  | title                   | rating | release_date |
  | Aladdin                 | G      | 25-Nov-1992  |
  | The Terminator          | R      | 26-Oct-1984  |
  | When Harry Met Sally    | R      | 21-Jul-1989  |
  | The Help                | PG-13  | 10-Aug-2011  |
  | Chocolat                | PG-13  | 5-Jan-2001   |
  | Amelie                  | R      | 25-Apr-2001  |
  | 2001: A Space Odyssey   | G      | 6-Apr-1968   |
  | The Incredibles         | PG     | 5-Nov-2004   |
  | Raiders of the Lost Ark | PG     | 12-Jun-1981  |
  | Chicken Run             | G      | 21-Jun-2000  |

Scenario: create new movie
  When I go to the create new movie page
  And  I fill in "Title" with "Glen or Glenda"
  And  I fill in "Director" with "Ed Wood"
  And  I press "Save Changes"
  Then the director of "Glen or Glenda" should be "Ed Wood"
