@quiz
  Feature: Quiz Demo
    Background:
      Given I open "login" page
      When I type "ask_instr@aol.com" into email field
      And I type "ABC123" into password field
      When I click "Sign In" button
      And I wait for 1 sec
      Then current url should contain "home"
      Then user role should be "TEACHER"
      When I click "Quizzes" menu item
      And I wait for 1 sec
      When I click "Create New Quiz" button
      And I wait for 1 sec

    @quiz1
    Scenario: Create a quiz
      And I type "TA Quiz Demo" as quiz title
      When I add a question
      And I wait for 1 sec
      When I select "Single" in "Q1"
      And I type "Question 1" into question field of "Q1"
      When I type "Option 1" into "Option 1*" field of "Q1"
      When I type "Option 2" into "Option 2*" field of "Q1"
      And I select "Option 2*" as a correct option in "Q1"
      When I click "Save" button
      And I wait for 1 sec
      Then "TA Quiz Demo" should be displayed on the list of quizzes
      And I delete "TA Quiz Demo" from the list of quizzes
