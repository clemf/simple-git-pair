Feature: Change
  As a pair of Software Engineers
  I want to put our names on a commit message
  So we both take credit and responsibility for our code

  Scenario: Pair up!
    Given there is a local repo
    And there is no pairs file
    When I run `git pair init`
    Then it creates a sample pairs file
    When I run `git pair nt ae`
    Then the output should contain "Nikola Tesla & Alfred Einstein"
    And the git username should be "Nikola Tesla & Alfred Einstein"
    When I commit some changes
    Then I should see "Nikola Tesla & Alfred Einstein" on the commit

  Scenario: Interactive creation of config file
    Given there is a local repo
    And there is no pairs file
    When I run `git pair nt ae` interactively
    And I type "yes"
    Then it should offer to create a sample config
    And it creates a sample pairs file
