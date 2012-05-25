Feature: Contacts

  Scenario:
    Given I am a registered user
    And I have no contacts
    And I have a new generic contact in mind
    And I am logged in
    And I am on the contacts page
    When I create a new contact
    Then the create a new contact lightbox should be displayed
    When I complete the new contact form with new generic contact in mind
    Then create a new contact should be complete with generic contact in mind
    And create a new contact success message should be displayed
    And create a new contact lightbox should not be displayed
    And I should be on the contacts page

  Scenario:
    Given I am a registered user
    And I have a generic contact
    And I have a generic_2 contact
    And I am logged in
    And I am on the contacts page
    Then contact list should contain count of 2 contacts
    And contact list should contain generic contact
    And contact list should contain generic_2 contact

  Scenario:
    Given I am a registered user
    And I have a generic contact
    And I am logged in
    And I am on the contacts page
    When I update contact generic contact
    Then the update contact lightbox should be visible with generic contact
    When I complete update contact with modified generic contact
    Then update contact should be complete with modified generic contact
    And update contact success message should be displayed
    And update contact lightbox should not be visible
    And I should be on contacts page