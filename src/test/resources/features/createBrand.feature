Feature: Test get brands operations

  Background:

    * url apiBasePath

  Scenario Outline: create a new brand with name <name> should return 201

    Given path 'brands'
    And request { name: <name>, description: <description>}
    When method POST
    Then status 201

    # assert response this way
    And match $ == { id: #number, name: <name>, description: <description>}

    # or like this
    And match $.id == '#number'
    And match $.name == '<name>'
    And match $.description == '<description>'

    Examples:
      | name     | description                             |
      | Mercedes | Cool cars made by our german colleagues |
      | Seat     | This ones are spanish                   |


    Scenario Outline: create a new brand using existing feature should work

      * def postBrandResult = call read('operations/postBrand.feature') { name: '#(name)', description: '#(description)' }
      * match postBrandResult.response.id == '#number'
      * match postBrandResult.response.name == '<name>'
      * match postBrandResult.response.description == '<description>'

      # This format is also valid
      * match postBrandResult.response['id'] == '#number'
      * match postBrandResult.response['name'] == '<name>'
      * match postBrandResult.response['description'] == '<description>'

      Examples:
        | name     | description                             |
        | Mercedes | Cool cars made by our german colleagues |
        | Seat     | This ones are spanish                   |