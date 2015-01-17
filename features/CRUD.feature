Feature: I would like to edit songs

  Scenario Outline: Insert records
    Given I am on homepage
    And I follow "Login"
    And I fill in "Username" with "admin"
    And I fill in "Password" with "loremipsum"
    And I press "Login"
    And I go to "/admin/song"
    Then I should not see "<song>"
    And I follow "Create a new entry"
    Then I should see "Song creation"
    When I fill in "Title" with "<song>"
    And I fill in "Content" with "<content>"
    And I press "Create"
    Then I should see "<song>"

  Examples:
    | song                    | content   |
    | SONG Hush little baby        | Hush...   |
    | SONG Sing a song of sixpence | Sing...   |
    | SONG Taxman                  | Taxman... |


  Scenario Outline: Edit records
    Given I am on homepage
    And I follow "Login"
    And I fill in "Username" with "admin"
    And I fill in "Password" with "loremipsum"
    And I press "Login"
    And I go to "/admin/song"
    Then I should not see "<new-song>"
    When I follow "<old-song>"
    Then I should see "<old-song>"
    When I follow "Edit"
    And I fill in "Title" with "<new-song>"
    And I fill in "Content" with "<new-content>"
    And I press "Update"
    And I follow "Back to the list"
    Then I should see "<new-song>"
    And I should not see "<old-song>"

  Examples:
    | old-song         | new-song             | new-content |
    | SONG Hush little baby | NEW Hush little baby | ...HUSH     |
    | SONG Taxman           | NEW Taxman           | ...taxman   |


  Scenario Outline: Delete records
    Given I am on homepage
    And I follow "Login"
    And I fill in "Username" with "admin"
    And I fill in "Password" with "loremipsum"
    And I press "Login"
    And I go to "/admin/song"
    Then I should see "<song>"
    When I follow "<song>"
    Then I should see "<song>"
    When I press "Delete"
    Then I should not see "<song>"

  Examples:
    |  song                   |
    | NEW Hush little baby    |
    | NEW Taxman              |
    | SONG Sing a song of sixpence |