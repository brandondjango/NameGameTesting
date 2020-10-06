Feature: Tries Counter

  Scenario: Verify Tries Counter increases once on a WRONG answer
    Given I am on the Name Game
    When I select a wrong photo
    Then I should see the Tries Counter show "1"

  Scenario: Verify Tries Counter increase correctly on CORRECT Answer
    Given I am on the Name Game
    When I select the correct photo
    Then I should see the Tries Counter show "1"

  Scenario: Verify Tries Counter only increases once on every wrong answer click
    Given I am on the Name Game
    When I select the same wrong photo "2" times
    Then I should see the Tries Counter show "1"

  Scenario: Verify Tries Counter increases after several iterations of the game - With wrong answers
    Given I am on the Name Game
    When I iterate through "10" questions of the name game selecting "2" wrong photos for every correct
    Then I should see the Tries Counter show "30"

  Scenario: Verify Tries Counter increases after several iterations of the game - With all correct answers
    Given I am on the Name Game
    When I iterate through "10" questions of the name game selecting "0" wrong photos for every correct
    Then I should see the Tries Counter show "10"

  Scenario: Verify Tries Counter increases to 100
    Given I am on the Name Game
    When I iterate through "20" questions of the name game selecting "4" wrong photos for every correct
    Then I should see the Tries Counter show "100"

  Scenario: Verify Tries Counter increases to 1000
    Given I am on the Name Game
    When I iterate through "200" questions of the name game selecting "4" wrong photos for every correct
    Then I should see the Tries Counter show "1000"




