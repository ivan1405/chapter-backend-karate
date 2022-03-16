Feature: Test get brands operations

  Background:

    * url apiBasePath
    * def postBrandResult = call read('operations/postBrand.feature') { name: 'to be deleted', description: 'some description' }
    * def brandId = postBrandResult.response.id

  Scenario: delete a brand

    Given path 'brands', brandId
    When method DELETE
    Then status 204

    # check it's been deleted
    Given path 'brands', brandId
    When method GET
    Then status 404
    And match $ == { httpStatus: 'NOT_FOUND', description: '#("No brand was found with id " + brandId)'}