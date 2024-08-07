@singleChoiceQuestion
Feature: Options

  Background:
    Given I open "login" page
    When I type "qa1@test.com" into email field
    And I type "ABC123" into password field
    When I click "Sign In" button
    And I wait for 1 sec
    Then current url should contain "home"
    Then user role should be "TEACHER"
    When I click "Quizzes" menu item
    And I wait for 1 sec
    When I click "Create New Quiz" button
    And I wait for 1 sec

  @singleChoiceQuestion1
  Scenario: Min number of options
    And I type "Min number of options" as quiz title
    When I add a question
    And I wait for 1 sec
    When I select "Single" in "Q1"
    And I wait for 3 sec
    And I click on settings icon of Option number 2
    Then "Delete Option" should be disabled

  @singleChoiceQuestion2
  Scenario: Max 15 choices
    And I type "Max 15 choices" as quiz title
    When I add a question
    And I wait for 1 sec
    When I select "Single" in "Q1"
    And I type "Question 1" into question field of "Q1"
    When I type "Option 1" into "Option 1*" field of "Q1"
    When I type "Option 2" into "Option 2*" field of "Q1"
    And I add 13 options with values
    And I select "Option 2*" as a correct option in "Q1"
    When I click "Save" button
    And I wait for 1 sec
    Then "Max 15 choices" should be displayed on the list of quizzes
    And I delete "Max 15 choices" from the list of quizzes

  @singleChoiceQuestion3
# Scenario fails. Known issue. Jira ticket JUN24-239
  Scenario: 16 choices
    And I type "16 choices" as quiz title
    When I add a question
    And I wait for 1 sec
    When I select "Single" in "Q1"
    And I type "Question 1" into question field of "Q1"
    When I type "Option 1" into "Option 1*" field of "Q1"
    When I type "Option 2" into "Option 2*" field of "Q1"
    And I add 13 options with values
    And I click "Add Option" button
    Then "Add Option" should be disabled

  @singleChoiceQuestion4
  Scenario: Include "Other text area option"
    And I type "Other text area option" as quiz title
    When I add a question
    And I wait for 1 sec
    When I select "Single" in "Q1"
    And I type "Question 1" into question field of "Q1"
    When I type "Option 1" into "Option 1*" field of "Q1"
    When I type "Option 2" into "Option 2*" field of "Q1"
    And I select "Option 2*" as a correct option in "Q1"
    And I select "Other text area option"
    When I click on "Preview"
    Then "Other" area should be displayed
    And I click on "Close"
    When I click "Save" button
    And I wait for 1 sec
    Then "Other text area option" should be displayed on the list of quizzes
    And I delete "Other text area option" from the list of quizzes

  @singleChoiceQuestion5
  Scenario: Delete option
    And I type "Delete option" as quiz title
    When I add a question
    And I wait for 1 sec
    When I select "Single" in "Q1"
    And I type "Question 1" into question field of "Q1"
    When I type "Option 1" into "Option 1*" field of "Q1"
    When I type "Option 2" into "Option 2*" field of "Q1"
    And I click "Add Option" button
    When I type "Option 3" into "Option 3*" field of "Q1"
    And I click on settings icon of Option number 3
    And I click on "Delete Option"
    Then Option 3 should be deleted

  @singleChoiceQuestion6
  Scenario Outline: Move option up/down
    And I type "<Move option>" as quiz title
    When I add a question
    And I wait for 1 sec
    When I select "Single" in "Q1"
    And I type "Question 1" into question field of "Q1"
    When I type "Option 1" into "Option 1*" field of "Q1"
    When I type "Option 2" into "Option 2*" field of "Q1"
    And I click "Add Option" button
    When I type "Option 3" into "Option 3*" field of "Q1"
    And I click on settings icon of Option number 2
    And I wait for 1 sec
    When I click on "<Move option>"
    Then option 2 should be moved

    Examples:
      | Move option      |
      | Move option up   |
      | Move option down |

  @singleChoiceQuestion7
  Scenario Outline: Option Field Max Length (1000 characters)
    And I type "Option Field Max Length (1000 characters)" as quiz title
    When I add a question
    And I wait for 1 sec
    When I select "Single" in "Q1"
    And I type "Question 1" into question field of "Q1"
    When I type 1000 characters having alphabetic "<alphabetic>" numeric "<numeric>" into "Option 1*" field of "Q1"
    When I type "Option 2" into "Option 2*" field of "Q1"
    And I select "Option 2*" as a correct option in "Q1"
    When I click "Save" button
    And I wait for 1 sec
    Then "Option Field Max Length (1000 characters)" should be displayed on the list of quizzes
    And I delete "Option Field Max Length (1000 characters)" from the list of quizzes

    Examples:
      | alphabetic | numeric |
      | true       | true    |
      | false      | true    |
      | true       | false   |


  @singleChoiceQuestion8
  Scenario Outline: Option Field Length (1001 characters)
#   Scenario fails. Known issue. Jira ticket JUN24-952
    And I type "Option Field Length (1001 characters)" as quiz title
    When I add a question
    And I wait for 1 sec
    When I select "Single" in "Q1"
    And I type "Question 1" into question field of "Q1"
    When I type 1001 characters having alphabetic "<alphabetic>" numeric "<numeric>" into "Option 1*" field of "Q1"
    When I type "Option 2" into "Option 2*" field of "Q1"
    And I select "Option 2*" as a correct option in "Q1"
    Then "Save" should be disabled

    Examples:
      | alphabetic | numeric |
      | true       | true    |
      | false      | true    |
      | true       | false   |





