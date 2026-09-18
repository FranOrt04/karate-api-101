@m04 @listas
Feature: Validar listas y cada elemento

  Background:
    Given url baseUrl
    And path 'productos'
    When method get
    Then status 200

  Scenario: Tamaño y primer elemento
    And match response == '#[3]'
    And match response[0].nombre == 'Teclado'

  Scenario: Cada producto tiene la misma forma
    And match each response ==
      """
      {
        id: '#number',
        nombre: '#string',
        precio: '#number',
        categoria: '#string',
        stock: '#number'
      }
      """

  Scenario: JSONPath sobre la lista
    And match response[*].id contains 2
    And match response[*].categoria contains 'pantalla'
