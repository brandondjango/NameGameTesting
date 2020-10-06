
Feature: Probability Testing

  #in this scenario, we will compare the same name answered correctly vs incorrectly when every other name is guessed INCORRECTLY
  #Remember, correct answers should appear LESS over time
  @only
  Scenario: Compare Names that are answered correctly vs incorrectly in a pool of INCORRECT Answers
    Given I am on the Name Game
    When I answer for the first name game name incorrectly, and every other name correct over "200" questions
    #Given I am on the Name Game
    #And I answer for the name "Greg Ciolli" incorrectly and every other name wrong over "200" questions
