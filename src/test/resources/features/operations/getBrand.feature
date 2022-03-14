Feature: Just get a single brand

  Background:

    * url apiBasePath

  Scenario: get brand should return 200
    Given path 'brands', id
    When method GET
    Then status 200