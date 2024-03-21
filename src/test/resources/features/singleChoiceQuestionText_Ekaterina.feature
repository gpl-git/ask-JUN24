@testAutomation
Feature: Single Choice Question Text

  Background:
    Given I go to "login" page
    When I type "artemapanashenko@asifboot.com" as email
    And I type "test123" as password
    When I click button "Sign In"
    And I wait for 1 sec
    And I click "Quizzes" menu item
    And I wait for 1 sec
    When I click button "Create New Quiz"
    And I wait for 1 sec
    When I type "Demo Quiz TA" as quiz title
    And I add a question
    And I select "Single" question in "Q1"

  @testAutomation1
  Scenario Outline: Single Choice Question field Accepts minimum 1 character and maximum 1000 and alphanumeric
    When I type <q1Value> into question field of "Q1"
    And I wait for 2 sec
    And I type "Option 1" into "Option 1*" of "Q1"
    And I type "Option 2" into "Option 2*" of "Q1"
    When I select "Option 1*" as a correct option in "Q1"
    And I click button "Save"
    And I wait for 1 sec
    Then "Demo Quiz TA" should be displayed on the list of quizzes
    Examples:
      | q1Value                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
      | "S"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
      | "Single choice@123"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
      | "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores." |

  @testAutomation2
  Scenario: Single Choice Question' field is a required field
    And I wait for 2 sec
    And I type "Option 1" into "Option 1*" of "Q1"
    And I type "Option 2" into "Option 2*" of "Q1"
    When I select "Option 1*" as a correct option in "Q1"
    When I click button "Save"
    And I wait for 2 sec
    Then element with "//*[contains(text(), 'This field is required')]" should be displayed

  @testAutomation3
  Scenario Outline: Single Choice Question should not accept 1001 characters and a single space character
    When I type <q1Value> into question field of "Q1"
    And I wait for 2 sec
    And I type "Option 1" into "Option 1*" of "Q1"
    And I type "Option 2" into "Option 2*" of "Q1"
    When I select "Option 1*" as a correct option in "Q1"
    And I click button "Save"
    And I wait for 1 sec
    Then "Demo Quiz TA" should not be displayed on the list of quizzes
    Examples:
      | q1Value                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
      | "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores e" |
      | " "                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |



