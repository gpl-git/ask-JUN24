@git

Feature: Webdriver Practice

  @git1
  Scenario: Username Input Field Behavior
    Given I open "sample"
    When I type "z" into username field
    And I submit the form
    Then username error message "Please enter at least 2 characters." should be displayed

  @git2
  Scenario Outline: Email field Input Validation
    Given I open "sample"
    When I type "<email>"
    And I submit the form
    And I wait for 1 sec
    Then error message "Please enter a valid email address." should be displayed
    Examples:
      | email                   |
      | emailgmail.com          |
      | email@domain@domain.com |
      | .email@domain.com       |
      | email.@domain.com       |
      | email..email@domain.com |
      | врворов@domain.com      |
      | email@-domain.com       |
      | email@.domain.com       |
      | email@111.222.333.44444 |
      | email@domain..com       |
      | email@gmailcom          |