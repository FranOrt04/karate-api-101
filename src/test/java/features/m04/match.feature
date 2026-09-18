@m04 @validaciones
Feature: match sobre un producto

  Background:
    Given url baseUrl
    And path 'productos', 1
    When method get
    Then status 200

  Scenario: Igualdad estricta de campos conocidos
    And match response.nombre == 'Teclado'
    And match response.precio == 25
    And match response.id == '#number'

  Scenario: Contiene un subconjunto de campos
    And match response contains { id: 1, categoria: 'periferico' }

  Scenario: El documento completo respeta el esquema
    And match response ==
      """
      {
        id: '#number',
        nombre: '#string',
        precio: '#number',
        categoria: '#string',
        stock: '#number'
      }
      """
