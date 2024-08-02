@webdriver
  Feature: WebDriver Scenarios

    @webdriver1
    Scenario: Password  and Confirm Password Fields Behavior
      Given I go to "sample"
      When I type "A1" incorrect password
      And I submit the form
      Then password error message should be displayed
      Then password error message "Please enter at least 5 characters." should be displayed
      When I clear password field
      Then password error message "This field is required." should be displayed
      And I submit the form
      Then confirm password field is disabled
      When I type "ABC123" into password field
      Then password error message should not be displayed
      When I type "A1" in confirm password field
      And I submit the form
      Then confirm password message should be displayed
      Then confirm password error message "Please enter at least 5 characters." should be displayed
      When I clear confirm password field
      Then confirm password error message "This field is required." should be displayed
      When I type "123456ABC" in confirm password field
      Then confirm password error message "Passwords do not match!" should be displayed
      When I clear confirm password field
      Then confirm password error message "This field is required." should be displayed
      When I type "ABC123" into confirm password field
      Then confirm password message should not be displayed