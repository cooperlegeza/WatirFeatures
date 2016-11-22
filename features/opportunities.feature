Feature: Opportunities

  Scenario: Filtering by location
    When I filter jobs by Columbus
    Then only Columbus opportunities are present

  Scenario: Filtering by type
    When I filter jobs by contract
    Then only contract opportunities are present
