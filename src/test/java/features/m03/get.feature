@m03 @http-get
Feature: Peticiones GET contra la tienda

  Background:
    Given url baseUrl

  Scenario: Listar todos los productos
    And path 'productos'
    When method get
    Then status 200
    And match response == '#[3]'
    And match response[0].id == 1

  Scenario: Obtener un producto por path
    And path 'productos', 2
    When method get
    Then status 200
    And match response.nombre == 'Monitor'
    And match response.categoria == 'pantalla'

  Scenario: Filtrar por query param
    And path 'productos'
    And param categoria = 'periferico'
    When method get
    Then status 200
    And match response == '#[2]'
    And match each response contains { categoria: 'periferico' }

  Scenario: Producto que no existe
    And path 'productos', 999
    When method get
    Then status 404
    And match response.mensaje == 'Producto no encontrado'
