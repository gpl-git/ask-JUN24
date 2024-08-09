@quizTotalQuestionsUlan
Feature: Quiz Demo

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
    And I type "TA Quiz bill" as quiz title of the ASK page
    And I wait for 1 sec
    When I add 5 Textual questions of the ASK page
    When I click "Save" button of the ASK page
    And I wait for 1 sec
#    Then "TA Quiz bill" should be displayed on the list of quizzes of the ASK page
#    And I wait for 1 sec
    Then "TA Quiz bill" should display "5" questions and delete quiz
    And I wait for 5 sec

  @quizTotalQuestionsUlan3
  Scenario Outline: Quiz Total Questions - allowed number
    And I type "TA Quiz Demo1" as quiz title of the ASK page
    And I wait for 1 sec
    When I add <num> Textual questions of the ASK page
    When I click "Save" button of the ASK page
    And I wait for 1 sec
    Then "TA Quiz Demo1" should be displayed on the list of quizzes of the ASK page
    And I wait for 1 sec
    Then "TA Quiz Demo1" should display <num1> questions and delete quiz
    And I wait for 5 sec
    Examples:
      | num | num1 |
      | 1 | "1" |
      | 3 | "3" |
      | 5 | "5" |


  @quizTotalQuestionsUlan4
  Scenario: Add 51 question US
    And I type "TA Quiz Demo1" as quiz title of the ASK page
    And I wait for 1 sec
    When I add 3 Textual questions of the ASK page
    Then button "Save" should be disabled US
    Then error message should be displayed US
