@userManagement

Feature: userManagement

  Background:
    Given I open "login" page
    When I type "ask_instr@aol.com" into email field
    And I type "ABC123" into password field
    When I click "Sign In" button
    And I wait for 1 sec
    Then current url should contain "home"
    Then user role should be "TEACHER"
    When I click "Users Management" menu item

  @userManagement1
  Scenario: Change Teacher's Role to Student
    And I click "Teachers" option
    Then "Tatsiana Simakovich" should be displayed on list of names
    And I wait for 3 sec
    When I click on "Tatsiana Simakovich" TS
    And I wait for 5 sec
    When I click on "Options" button
    And I wait for 1 sec
    When I select "Change User's Role" TS
    And I click "Change Role"
    And I wait for 3 sec
    Then user role should be displayed "STUDENT"

  @userManagement2
  Scenario: Change Student's Role to Teacher
    Then "Tatsiana Simakovich" should be displayed on list of names
    And I wait for 3 sec
    When I click on "Tatsiana Simakovich" TS
    And I wait for 5 sec
    When I click on "Options" button
    And I wait for 1 sec
    When I select "Change User's Role" TS
    And I click "Change Role"
    And I wait for 3 sec
    Then user role should be displayed "TEACHER"

  @userManagement3
  Scenario: Change Role - "No, Thanks" button
    And I click "Teachers" option
    Then "Tatsiana Simakovich" should be displayed on list of names
    And I wait for 3 sec
    When I click on "Tatsiana Simakovich" TS
    And I wait for 5 sec
    When I click on "Options" button
    And I wait for 1 sec
    When I select "Change User's Role" TS
    When I click on the "No,Thanks"
    Then user role should be displayed "TEACHER"










