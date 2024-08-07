@regQuizTotalQuestionsUlan
Feature: Registration

  Background:
    Given I open "registration" page of the ASK page US
    When I type "Harry" into firstname filed of the ASK page
    And I type "Potter" into lastname field of the ASK page
    When I type "h_potter@wizard.com" into email field of the ASK page
    And I type "XYZ" into group field of the ASK page
    And I type "12345" into confirmPassword field of the ASK page


  @regQuizTotalQuestionsUlan1 @smoke
  Scenario: Happy Path
    Given I open "registration" page of the ASK page US
    When I type "Harry" into firstname filed of the ASK page
    And I type "Potter" into lastname field of the ASK page
    When I type "h_potter@wizard.com" into email field of the ASK page
    And I type "XYZ" into group field of the ASK page
#      When I type "12345" into password field
    And I type "12345" into confirmPassword field of the ASK page
    When I submit the form of the ASK page
    And I wait for 1 sec
    Then confirmation message should be displayed of the ASK page
    Then message "You have been Registered." should be displayed of the ASK page


  @regQuizTotalQuestionsUlan2
  Scenario: Error Message
    When I type "" into password field of the ASK page
    When I submit the form of the ASK page
    Then error message "This field is required" should be displayed of the ASK page
