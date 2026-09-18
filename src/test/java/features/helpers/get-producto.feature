@ignore
Feature: Helper — obtener un producto por id

  Scenario:
    Given url baseUrl
    And path 'productos', id
    When method get
    Then status 200
