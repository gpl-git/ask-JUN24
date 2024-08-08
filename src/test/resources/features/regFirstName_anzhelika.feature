@regFirstName

  Feature: Registration - First name

    Background:
      Given I open "registration" page
      And I type "P" into lastname field
      When I type "h_potter@wizard.com" into email field
      And I type "XYZ" into group field
      When I type "12345" into password field
      And I type "12345" into confirmPassword field

    @regFirstName1
    Scenario Outline: Happy Path
      When I type <firstName> into firstname filed
      When I submit the form
      And I wait for <sec> sec
      Then confirmation message should be displayed
      Then message <expMessage> should be displayed
      Examples:
        | firstName   | sec | expMessage                  |
        | "Harry"     | 1   | "You have been Registered." |
        | "H12*&_as!" | 1   | "You have been Registered." |
        | "H"         | 1   | "You have been Registered." |

    @regFirstName2
    Scenario: Happy Path3
      When I type 254 characters into firstname filed
      When I submit the form
      And I wait for 1 sec
      Then confirmation message should be displayed
      Then message "You have been Registered." should be displayed

    @regFirstName3
    Scenario Outline: Error Message1
      When I type <firstName> into firstname filed
      When I submit the form
      And I wait for 1 sec
      Then error message <expError> should be displayed
      Examples:
        | firstName           | expError                         |
        | ""                  | "This field is required"         |
        | "Anna Maria"        | "Whitespaces are not allowed"    |

    @regFirstName4
    Scenario: Error Message2
      When I type 255 characters into firstname filed
      When I submit the form
      And I wait for 3 sec
      Then error message in pop-up window  should be displayed
      Then error message "Data too long for column 'name' at row 1" in pop-up window  should be displayed
