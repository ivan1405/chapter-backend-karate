Feature: POST brand operation

  Background:

    * url apiBasePath

  Scenario: Create a brand

    # create a new brand
    Given path 'brands'
    And request { name: '#(name)', description: '#(description)'}
    When method POST
    Then status 201