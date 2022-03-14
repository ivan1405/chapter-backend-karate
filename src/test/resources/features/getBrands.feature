Feature: Test get brands operations

  Background:

    * url apiBasePath

  Scenario: get brands should return 200 and list of available brands

    Given path 'brands'
    When method GET
    Then status 200
    And match each $ contains { id: '#number' }
    And match each $ contains { name: '#string' }
    And match each $ contains { description: '#string' }

    # Another way to do the same validations
    And match $[*].id contains '#number'
    And match $[*].name contains '#string'
    And match $[*].description contains '#string'

    * def id = $[0].id

    Given path 'brands/' + id
    When method GET
    Then status 200
    * print response