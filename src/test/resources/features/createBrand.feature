Feature: Test get brands operations

  Background:

    * url apiBasePath

  Scenario Outline: create a new brand should return 201

    Given path 'brands'
    And request { name: <name>, description: <description>}
    When method POST
    Then status <http_status>

    # assert response this way
    And match $ == { id: #number, name: <name>, description: <description>}

    # or like this
    And match $.id == '#number'
    And match $.name == '<name>'
    And match $.description == '<description>'

    Examples:
      | name     | description                             | http_status |
      | Mercedes | Cool cars made by our german colleagues | 201         |
      | Seat     | This ones are spanish                   | 201         |