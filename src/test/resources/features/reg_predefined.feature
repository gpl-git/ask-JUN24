@reg
  Feature: Registration

      Background:
      Given I open "registration" page
      When I type "Harry" into firstname filed
      And I type "Potter" into lastname field
      When I type "h_potter@wizard.com" into email field
      And I type "XYZ" into group field
      And I type "12345" into confirmPassword field


    @reg1 @smoke
    Scenario: Happy Path
      Given I open "registration" page
      When I type "Harry" into firstname filed
      And I type "Potter" into lastname field
      When I type "h_potter@wizard.com" into email field
      And I type "XYZ" into group field
#      When I type "12345" into password field
      And I type "12345" into confirmPassword field
      When I submit the form
      And I wait for 1 sec
      Then confirmation message should be displayed
      Then message "You have been Registered." should be displayed


      @reg2
      Scenario: Error Message
        When I type "" into password field
        When I submit the form
        Then error message "This field is required" should be displayed
