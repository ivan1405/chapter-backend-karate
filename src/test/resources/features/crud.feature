Feature: test whole happy path e2e

  Background:

    * url apiBasePath

  Scenario: Create a brand, retrieve it, and delete it

    # create a new brand
    Given path 'brands'
    And request { name: 'test name', description: 'test description'}
    When method POST
    Then status 201
    * def id = response.id

    # retrieve it calling the GET endpoint directly
    Given path 'brands', id
    When method GET
    Then status 200
    And match $.id == id
    And match $.name == 'test name'
    And match $.description == 'test description'

    # or reuse an existing feature
    * def result = call read('operations/getBrand.feature') { id: '#(id)' }
    * assert result.response.id == id
    * assert result.response.name == 'test name'
    * assert result.response.description == 'test description'

    # delete it
    Given path 'brands', id
    When method DELETE
    Then status 204

    # check it's been deleted
    Given path 'brands', id
    When method GET
    Then status 404
    And match $ == { httpStatus: 'NOT_FOUND', description: '#("No brand was found with id " + id)'}