@reg
  
  Feature: Registration Scenarios for Password/Confirm Password

    Background:
      Given I go to "registration" page
      And I wait for 2 sec
      When I type "Alice" into the first name field
      And I type "Wonderland" into the last name field
      When I type "annvar@agrostroy1.site" as email
      And I type "ABC" into group code field

    @reg1
    Scenario: Registration Happy Path
      When I type "12345" as password
      And I type "12345" as confirm password
      When I click button "Register Me"
      And I wait for 1 sec
      Then confirmation message "You have been Registered." should be displayed

    @reg2
    Scenario Outline: Characters and Length - Outline
      When I type <password> as password
      And I type <confirmPassword> as confirm password
      When I click button "Register Me"
      And I wait for 1 sec
      Then confirmation message <expMessage> should be displayed
      Examples:
        | password  | confirmPassword     |   expMessage                 |
        | "12345"   | "12345"             | "You have been Registered." |
        | "ABCDEF"    | "ABCDEF"          | "You have been Registered." |
        | "abcdef"    | "abcdef"           | "You have been Registered." |
        | "Abc!@#%"  | "Abc!@#%"           | "You have been Registered." |
        | "Abc!@#%"  | "Abc!@#%"           | "You have been Registered." |
        | "Abc!@#%ghghghghghghghghghg%^^^77"  | "Abc!@#%ghghghghghghghghghg%^^^77"           | "You have been Registered." |

  @reg3
  @reg1
  Scenario: Registration password length
    When I type 32 characters into password and confirm password field
    When I click button "Register Me"
    And I wait for 1 sec
    Then confirmation message "You have been Registered." should be displayed







    