@ignore
Feature: Just get a single brand

  Background:

    * url apiBasePath

  Scenario: delete brand should return 204
    Given path 'brands', id
    When method DELETE
    Then status 204