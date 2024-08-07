@passReset

Feature: Password Reset
Background:
  Given I open "login" page
  When I click link or button by text "I forgot my password"
  When I type "ypuf7rgd@dmxs8.com" into email field
  When I click "Request Password Reset" button
  Then I wait for element with text "Your request is confirmed" to be present
  And I wait for 4 sec
  Given I got to email inbox
  Then I wait for element with text "Reset Password" to be present
  When I click link or button by text "Reset Password"
  Then I switch to first window
  When I click link or button by text "Delete Message"
  And I wait for 1 sec
  And I close the current window
  Then I switch to first window

  @passReset1
  Scenario: Reusing the old Password
    When I type "12345" into password field
    And I type "12345" into confirmPassword field
    When I submit the form
    Then I wait for 1 sec
    Then I check the response message to be "New Password cannot be old"

  @passReset2
  Scenario: Using A New Password
      When I type "ABC123" into password field
      And I type "ABC123" into confirmPassword field
      When I submit the form
      Then I wait for 1 sec
      Then I check the response message to be "Your Password was Changed"
      When I submit the form
      Then I check that I am on login page

  @passReset3
  Scenario: Password Mismatch
    When I type "ABC123" into password field
    And I type "ABC123$" into confirmPassword field
    When I submit the form
    And I wait for 1 sec
    Then I check the response message to be "Password mismatch"

  @passReset4
  Scenario: Blank Password Field
    When I submit the form
    And I wait for 1 sec
    Then I check the response message to be "Field Required"

  @passReset5
  Scenario: 4-Character Password
    When I type "ABC1" into password field
    And I type "ABC1" into confirmPassword field
    When I submit the form
    And I wait for 1 sec
    Then I check the response message to be "Password too short"

  @passReset6
  Scenario: 5-Character Password
    When I type "ABC1%" into password field
    And I type "ABC1%" into confirmPassword field
    When I submit the form
    Then I wait for 1 sec
    Then I check the response message to be "Your Password was Changed"
    When I submit the form
    Then I check that I am on login page

  @passReset7
  Scenario: 15-character Password
    When I type "Abcdefghij12345" into password field
    And I type "Abcdefghij12345" into confirmPassword field
    When I submit the form
    Then I wait for 1 sec
    Then I check the response message to be "Your Password was Changed"
    When I submit the form
    Then I check that I am on login page

  @passReset8
  Scenario: 32-character Password
    When I type "abcdefghijklmnopqrstuvwxyzzz123*" into password field
    And I type "abcdefghijklmnopqrstuvwxyzzz123*" into confirmPassword field
    When I submit the form
    Then I wait for 1 sec
    Then I check the response message to be "Your Password was Changed"
    When I submit the form
    Then I check that I am on login page

  @passReset9
  Scenario: 33-character Password
    When I type "1235889652&^%dsjyfgdgmfmgbikfisdm" into password field
    And I type "1235889652&^%dsjyfgdgmfmgbikfisdm" into confirmPassword field
    When I submit the form
    And I wait for 1 sec
    Then I check the response message to be "Password is too long"

  @passReset10
  Scenario: Password With A White Space
    When I type "1234 5" into password field
    And I type "1234 5" into confirmPassword field
    When I submit the form
    And I wait for 1 sec
    Then I check the response message to be "Whitespace Error"

    @passReset11
    Scenario: Reseting to generic password for first test
      When I type "12345" into password field
      And I type "12345" into confirmPassword field
      When I submit the form
      Then I wait for 1 sec
      Then I check the response message to be "Your Password was Changed"
      When I submit the form
      Then I check that I am on login page