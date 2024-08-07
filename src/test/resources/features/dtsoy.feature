@name
  Feature: Teacher: Settings - Full Name

    @name1
    Scenario:Teacher: Settings - Full Name
      Given I open "login" page
      When I type "hells69b@aovgarenar.com" into email field
      And I type "1337" into password field
      Then I click "Sign In" button
      And I wait for 1 sec
      Then user role should be "TEACHER"
      Then current url should contain "home"
      When I click "Settings" menu item
      And I wait for 1 sec
      When I click "Change Your Name" button
      Then element with title "Change Your Name" should be displayed
      Then I clear the input "FullName"
      When I type "Dmitriy" into Full Name filed
      And I wait for 1 sec
      Then error message "Should contain only first and last name" should be displayed
      And I wait for 1 sec
      Then I clear the input "FullName"
      When I type "Dmitriy Tsoy" into Full Name filed
      And I wait for 2 sec
      When I click "Change" button