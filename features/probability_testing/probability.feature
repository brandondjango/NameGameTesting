
Feature: Probability Testing

  #in this scenario, we will compare the same name answered correctly vs incorrectly when every other name is guessed INCORRECTLY
  #Remember, correct answers should appear LESS over time

  @proabability
  Scenario: Incorrect Name-Correct Pool
    Given I am on the Name Game
    When I answer for the first name game name incorrectly, and every other name correct over "200" questions

  @proabability
  Scenario: Correct Name-Incorrect Pool
    Given I am on the Name Game
    When I answer for the first name game name correctly, and every other name incorrectly over "200" questions

  @proabability
  Scenario: Incorrect Name-InCorrect Pool
    Given I am on the Name Game
    When I answer for the first name game name incorrectly, and every other name incorrect over "200" questions

  @proabability
  Scenario: Correct Name-Correct Pool
    Given I am on the Name Game
    When I answer for the first name game name correctly, and every other name correctly over "200" questions
