@git

  Feature: Webdriver Practice

    @git1
    Scenario: Username Input Field Behavior
      Given I open "sample"
      When I type "z" into username field
      And I submit the form
      Then username error message "Please enter at least 2 characters." should be displayed
