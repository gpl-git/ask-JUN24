@git

Feature: Git practice

  @git1
  Scenario: Git commit/git push
    Given I learn git commands
    When I use "git commit" command
    And I use "git push" command
    Then my code should be pushed to remote branch

    @git2
    Scenario:

