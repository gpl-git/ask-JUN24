@quiz
Feature: Textual Question- Text
  Background:
    Given I open "login" page
    And I wait for 2 sec
    When I type "ask_instr@aol.com" into email field
    And I type "ABC123" into password field
    When I click "Sign In" button
    And I wait for 1 sec
    Then current url should contain "home"
    Then user role should be "TEACHER"
    When I click "Quizzes" menu item
    And I wait for 1 sec
    When I click "Create New Quiz" button


  @quiz1 @smoke
  Scenario: Textual Question - Alphanumeric & Special characters
    And I wait for 1 sec
    And I type "TA bindu Quiz" as quiz title
    When I add a question
    And I wait for 2 sec
    When I select "Textual" in "Q1"
    And  I wait for 2 sec
    When I type "Q123!" into Question
    And I click "Save" button
    And I wait for 2 sec
    Then "TA bindu Quiz" should be displayed on the list of quizzes

    @quiz2
    Scenario: Textual Question - Single Character
      And I wait for 1 sec
      And I type "TA bindu Quiz12" as quiz title
      When I add a question
      And I wait for 1 sec
      When I select "Textual" in "Q1"
      And  I wait for 1 sec
      When I type "A" into Question
      And I click "Save" button
      And I wait for 4 sec
      Then "TA bindu Quiz12" should be displayed on the list of quizzes
      And I wait for 3 sec
      And I delete "TA bindu Quiz12" from the list of quizzes BF


      @quiz3
      Scenario: Textual Question -  Field is Required
        And I wait for 2 sec
        And I type "TA binduQuiz2" as quiz title
        When I add a question
        And I wait for 2 sec
        When I select "Textual" in "Q1"
        And  I wait for 2 sec
        When I type "" into Question
        And I click "Save" button
        And I wait for 4 sec
        Then error message should be displayed
        Then error message "This field is required" should be displayed


        @quiz4
        Scenario: Textual Question - Max 1000 Characters
          And I wait for 2 sec
          And I type "TA binduQuiz3" as quiz title
          When I add a question
          And I wait for 2 sec
          When I select "Textual" in "Q1"
          And  I wait for 2 sec
          When I enter 1000 alphanumeric characters
          And I click "Save" button
          And I wait for 2 sec
          Then "TA binduQuiz3" should be displayed on the list of quizzes

          @quiz5
          Scenario: Textual Question - Over 1000 Characters
            # Scenario fails, Known issue.
            And I wait for 2 sec
            And I type "TA binduQuiz4" as quiz title
            When I add a question
            And I wait for 2 sec
            When I select "Textual" in "Q1"
            And  I wait for 2 sec
            When I enter 1001 alphanumeric characters
            Then error message should be displayed
            And I click "Save" button
            And I wait for 2 sec
            Then error message should be displayed




