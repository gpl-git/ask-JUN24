@quizTotalQuestionsUlan
Feature: Quiz Demo6

  Background:
    Given I open "login" page of The ASK page US
    When I type "dub07@freeprodesign.com" into email field of the ASK page
    And I type "12345" into password field of the ASK page
    When I click "Sign In" button of the ASK page
    And I wait for 1 sec
    Then current url should contain "home" of the ASK page
    Then user role should be "TEACHER" of the ASK page
    When I click "Quizzes" menu item of the ASK page
    And I wait for 1 sec
    When I click "Create New Quiz" button of the ASK page
    And I wait for 1 sec

  @quizTotalQuestionsUlan1
  Scenario: Create a quiz
    And I type "TA Quiz Demo" as quiz title of the ASK page
    When I add a question of the ASK page
    And I wait for 1 sec
    When I select "Single" in "Q1" of the ASK page
    And I type "Question 1" into question field of "Q1" of the ASK page
    When I type "Option 1" into "Option 1*" field of "Q1" of the ASK page
    When I type "Option 2" into "Option 2*" field of "Q1" of the ASK page
    And I select "Option 2*" as a correct option in "Q1" of the ASK page
    When I click "Save" button of the ASK page
    And I wait for 1 sec
    Then "TA Quiz Demo" should be displayed on the list of quizzes of the ASK page
    And I delete "TA Quiz Demo" from the list of quizzes of the ASK page

  @quizTotalQuestionsUlan2
  Scenario: Add 5 question US
    And I type "TA Quiz Demo1" as quiz title of the ASK page
    And I wait for 5 sec
    When I add 5 Textual questions of the ASK page
    And I wait for 10 sec
    When I click "Save" button of the ASK page
    Then "TA Quiz Demo1" should be displayed on the list of quizzes of the ASK page
#    Then element "TA Quiz Demo1 5 questions" should be displayed on the list of quizzes of the ASK page
    And I wait for 10 sec
    And I delete "TA Quiz Demo1" from the list of quizzes of the ASK page


  @quizTotalQuestionsUlan3
  Scenario Outline: Add 6 question US
    And I type "TA Quiz Demo1" as quiz title of the ASK page
    And I wait for 5 sec
    When I add <quantity> Textual questions of the ASK page
    And I wait for 10 sec
    When I click "Save" button of the ASK page
    Then "TA Quiz Demo1" should be displayed on the list of quizzes of the ASK page
#    Then element <name> 5 questions should be displayed on the list of quizzes of the ASK page
    And I wait for 10 sec
    Then "TA Quiz Demo1" should be displayed on the list of quizzes of the ASK page
    And I delete "TA Quiz Demo1" from the list of quizzes of the ASK page
    Examples:
      | quantity |
      | 5        |
      | 50       |
      | 51       |