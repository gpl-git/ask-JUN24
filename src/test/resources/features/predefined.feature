@predefined
Feature:



  @pred1
  Scenario: Registration  password length
    When I type  32 characters into password and confirm password  field
    Then I click button "Register me"


  @pred2
  Scenario: Quiz - Total Questions
    When I type "Demo Quiz Total Questions" as Quiz title
    And I add 3 Textual questions
    And I click button "Save"
    And I wait for 1 sec
    Then "Demo Quiz Total Question" should be displayed on the list of quizzes
    And I delete "Demo Quiz Total Question" from the list of the quizzes

  @pred2
  Scenario: Quiz - SC Question Number Of Options
    When I type "Demo Quiz SC Questions" as Quiz title
    And I add a question
    When  I  select "Single Question" in "Q1"
    And I type "Question 1" into question field of "Q1"
    Then I type "Option 1" into "Option 1" of "Q1"
