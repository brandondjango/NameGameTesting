@only
Feature: Streaks Counter

  Scenario: Verify Streaks Counter does NOT increase on a WRONG answer
    Given I am on the Name Game
    When I select a wrong photo
    Then I should see the Streaks Counter show "0"

  Scenario: Verify Streaks Counter increase correctly on CORRECT Answer
    Given I am on the Name Game
    When I select the correct photo
    Then I should see the Streaks Counter show "1"

  Scenario: Verify Streaks Counter only increases once on every correct answer click
    Given I am on the Name Game
    When I select the same correct photo "2" times
    Then I should see the Streaks Counter show "1"

  Scenario: Verify Streaks Counter increases after several iterations of the game - With wrong answers
    Given I am on the Name Game
    When I iterate through "10" questions of the name game selecting "2" wrong photos for every correct
    Then I should see the Streaks Counter show "1"

  Scenario: Verify Streaks Counter increases after several iterations of the game - With all correct answers
    Given I am on the Name Game
    When I iterate through "10" questions of the name game selecting "0" wrong photos for every correct
    Then I should see the Streaks Counter show "10"

  Scenario: Verify Streaks Counter increases to 100
    Given I am on the Name Game
    When I iterate through "100" questions of the name game selecting "0" wrong photos for every correct
    Then I should see the Streaks Counter show "100"

  Scenario: Verify Streaks Counter increases to 1000
    Given I am on the Name Game
    When I iterate through "1000" questions of the name game selecting "0" wrong photos for every correct
    Then I should see the Streaks Counter show "1000"




