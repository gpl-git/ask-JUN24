@quiz_predefined
Feature: Create a Quiz
  Background:
    Given I open "login" page
    When I type "ask_instr@aol.com" into email field
    And I type "ABC123" into password field
    When I click "Sign In" button
    And I wait for 1 sec
    Then user role "TEACHER" should be displayed
    When I click "Quizzes" menu item
    And I wait for 1 sec
    When I click "Create New Quiz" button
    And I wait for 1 sec

  @quiz_predefined1
  Scenario: Quiz Demo
    When I type "Quiz Demo Title" as quiz title
    And I add a question
    And I wait for 1 sec
    When I select "Single" question in "Q1"
    When I type "Question 1" into question filed of "Q1"
    And I type "Option 1" into "Option 1*" field of "Q1"
    And I type "Option 2" into "Option 2*" field of "Q1"
    When I select "Option 2*" as a correct option in "Q1"
    When I click "Save" button
    And I wait for 1 sec
    Then "Quiz Demo Title" should be displayed on the list of quizzes
    And I delete "Quiz Demo Title" from the list of quizzes