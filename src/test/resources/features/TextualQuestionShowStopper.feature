@textual
  Feature: Textual Question Show Stopper

   Background:
     Given I navigate to "login" page
     When I sign in using "ask_instr@aol.com" as a login and "ABC123" as a password
     And I wait for 1 sec
     Then current url should contain "home"
     Then user role should be "TEACHER"
     When I click "Quizzes" menu item
     And I wait for 1 sec
     When I click "Create New Quiz" button
     And I wait for 1 sec

   @textual
   Scenario: I create Quiz
     When I click on "Quizzes" menu item
     And I wait for 1 sec
     When I click on "Create New Quiz" button
     And I wait for 1 sec
     When I type "Q1" into quiz title input field
     And I click on Add question button
     When I choose type of the question as "//*[contains(text(),'Textual')]"
     And I wait for 2 sec