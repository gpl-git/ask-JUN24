@testAutomation
Feature: Single Choice Question Showstopper

  Background:
    Given I go to "login" page
    When I type "apuzin@lunaaabnjfk.shop" as email
    And I type "12345" as password
    When I click button "Sign In"
    And I wait for 1 sec
    And I click "Quizzes" menu item
    And I wait for 1 sec
    When I click button "Create New Quiz"
    And I wait for 1 sec
    When I type "Demo Quiz Kyrylo" as quiz title
    And I add a question
    And I select "Single" question in "Q1"

  @testAutomation1
  Scenario: Single Choice question with Showstopper
    When I type "TestQuestion" into question field of "Q1"
    Then "Show-Stopper" option should be displayed
    And I wait for 1 sec
    And make Question 1 Showstopper
    And * should be displayed near "Q1"
    And I type "Option 1" into "Option 1*" of "Q1"
    And I type "Option 2" into "Option 2*" of "Q1"
    When I select "Option 1*" as a correct option in "Q1"
    And I click button "Preview"
    Then "Show-Stopper" should be displayed
    And I wait for 1 sec
    And I click button "Close"



