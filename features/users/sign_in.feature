@wip
Feature: Sign in
  In order to get access to protected sections of the site
  A user
  Should be able to sign in

  Scenario: User is not signed up
    Given I do not exist as a user
    When I sign in with valid credentials
    Then I see an invalid login message
    And I should be signed out

  Scenario: User signs in successfully
    Given I exist as a user
    And I am not logged in
    When I sign in with valid credentials
    Then I see a successful sign in message
    When I return to the site
    Then I should be signed in

  Scenario: User enters wrong email
    Given I exist as a user
    And I am not logged in
    When I sign in with a wrong email
    Then I see an invalid login message
    And I should be signed out

  Scenario: User enters wrong password
    Given I exist as a user
    And I am not logged in
    When I sign in with a wrong password
    Then I see an invalid login message
    And I should be signed out

  #Scenario: User is not signed up and tries to sign up with Facebook
    #Given I do not exist as a user
    #When I sign in as a user with "Facebook"
    #Then I see an unconfirmed account message

  #Scenario: User is already signed up and tries to sign in with Facebook
    #Given I exist as a "Facebook" user
    #And I am not logged in
    #When I sign in as a user with "Facebook"
    #Then I see a successful sign in message
    #And I see an unconfirmed account message

  Scenario: User can only sign in with email or Facebook
    Given I exist as a user
    And I am not logged in
    When I visit the sign in path
    Then I should see a link that goes to "/customers/auth/facebook"
