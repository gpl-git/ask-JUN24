@lname
  Feature: lname
    @lname1
  Scenario: Aplhanumer & special characters
  Given I open "registration" page
      When I type "Harry" into firstname filed
  And I type "AABCabc123(*^%%&&" into lastname field
  When I type "test@test.com" into email field
  And I type "JUN24" into group field
  When I type "12345" into password field
  And I type "12345" into confirmPassword field
      When I submit the form
   And I wait for 5 sec
   Then confirmation message should be displayed
    Then message "You have been Registered" should be displayed

@lname2
 Scenario: empty lname field
  Given I open "registration" page
  When I type "Harry" into firstname filed
  And I type "" into lastname field
  When I type "test@test.com" into email field
  And I type "JUN24" into group field
  And I type "12345" into password field
  And I type "12345" into confirmPassword field
  Then error message "This field is required" should be displayed


@lanme3
Scenario: 254 characters
  Given I open "registration" page
  When I type "A" into firstname filed
  And I type "jsrxtjxfgxkhmjckvjvhlhkghjkbhgfhdgszdfgkhbjkvjchgxfghtyju345678909876567re4rw7)(%$#$%&(VBNJRE$%&IOLKJHGTYU()PLMNJYTRE#$%&()P)(&TFGHUYTRFE#$%&()_{PLKJNBVGYGFGTFTRDFYIFVKUYGIUYFITFIUGVKUGFYTFIGFYTFYGVKUHVKGFJYTFYRYR$%^&U*IOJHGTYUIOP{)(&YHjkvgjxhjmgxch,kct" into lastname field
  When I type "test@test.com" into email field
  And I type "JUN24" into group field
  And I type "12345" into password field
  And I type "12345" into confirmPassword field
  When I submit the form
  And I wait for 1 sec
  Then confirmation message should be displayed
  Then message "You have been Registered" should be displayed

@lname4
Scenario: 1 character only
  Given I open "registration" page
  When I type "Harry" into firstname filed
  And I type "A" into lastname field
  When I type "test@test.com" into email field
  And I type "JUN24" into group field
  And I type "12345" into password field
  And I type "12345" into confirmPassword field
  When I submit the form
  And I wait for 1 sec
  Then confirmation message should be displayed
  Then message "You have been Registered" should be displayed

@lname5
Scenario: White spaces
  Given I open "registration" page
  When I type "Harry" into firstname filed
  And I type " " into lastname field
  When I type "test@test.com" into email field
  And I type "JUN24" into group field
  And I type "12345" into password field
  And I type "12345" into confirmPassword field
  When I submit the form
  And I wait for 1 sec
  Then error message "Whitespaces are not allowed" should be displayed

@lname6
Scenario: 255 characters
  Given I open "registration" page
  When I type "A" into firstname filed
  And I type "jsrxtjxfgxkhmjckvjvhlhkghjkbhgfhdgszdfgkhbjkvjchgxfghtyju345678909876567re4rw7)(%$#$%&(VBNJRE$%&IOLKJHGTYU()PLMNJYTRE#$%&()P)(&TFGHUYTRFE#$%&()_{PLKJNBVGYGFGTFTRDFYIFVKUYGIUYFITFIUGVKUGFYTFIGFYTFYGVKUHVKGFJYTFYRYR$%^&U*IOJHGTYUIOP{)(&YHjkvgjxhjmgxch,kct" into lastname field
  When I type "test@test.com" into email field
  And I type "JUN24" into group field
  And I type "12345" into password field
  And I type "12345" into confirmPassword field
  When I submit the form
  Then confirmation message should be displayed
  And I wait for 2 sec
  Then message "You have been Registered" should be displayed



