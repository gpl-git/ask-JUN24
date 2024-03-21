@ASK_yanaG
Feature: Textual Question with Show-Stopper

  Background:
      Given I go to "login" page
      And I type "qa1@test.com" as email
      And I type "ABC123" as password
      And I click button "Sign In"
      And I wait for 1 sec
      And I click "Quizzes" menu item
      And I wait for 1 sec
      When I click button "Create New Quiz"
      And I wait for 1 sec

    @ASK_yanaG1
    Scenario: Textual Question with Show-Stopper
      When I type "Demo_01" as quiz title
      And I add a question
      And I select "Textual" question in "Q1"
      When I type "Demo Question_1" into question field of "Q1"
      Then "Show-Stopper" should be displayed
      And I make question 1 Show-Stopper
      And * should be displayed near "Q1"
      When I click button "Preview"
      Then "Show-Stopper" should be displayed
      And I wait for 1 sec
      And I click button "Close"
      When I add a question
      And I wait for 1 sec
      And I select "Textual" question in "Q2"
      And I type "Demo Question_2" into question field of "Q2"
      And I wait for 1 sec
      And I make question 2 Show-Stopper
      Then * should be displayed near "Q2"
      And * should not be displayed near "Q1"
      When I click button "Save"
      And I wait for 1 sec
      Then "Demo_01" should be displayed on the list of quizzes
      And I delete "Demo_01" from the list of quizzes