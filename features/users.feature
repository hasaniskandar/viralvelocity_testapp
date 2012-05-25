Feature: Users

  Scenario:
    Given I am an unregistered user
    And I am on the homepage
    And I am not logged in
    When I register
    Then the registration lightbox should be visible
    When I complete the registration form
    Then the registration should be complete
    And the registration lightbox should not be visible
    And I should be on the homepage
    And I should be logged in

  Scenario:
    Given I am a registered user
    And I am on the homepage
    And I am not logged in
    When I login
    Then the login lightbox should be visible
    When I complete the login form
    Then login should be complete
    And the login lightbox should not be visible
    And I should be on the homepage
    And I should be logged in

  Scenario:
    Given I am an invalid user
    And I am on the homepage
    And I am not logged in
    When I login
    Then the login lightbox should be visible
    When I complete the login form
    Then login should be incomplete
    And invalid user login error message should be displayed
    And the login lightbox should be visible
    And I should be on the homepage
    And I should not be logged in