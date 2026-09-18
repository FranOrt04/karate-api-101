@smoke @m01
Feature: Humo del laboratorio

  Scenario: La API de tienda responde el catálogo
    Given url baseUrl
    And path 'productos'
    When method get
    Then status 200
    And match response == '#[3]'
    And match response[0].nombre == 'Teclado'
