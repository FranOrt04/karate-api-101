@m06 @ddt-ficheros
Feature: Data-driven con CSV y JSON

  Background:
    Given url baseUrl

  Scenario Outline: Precios leídos de un CSV
    And path 'productos', <id>
    When method get
    Then status 200
    And match response.nombre == '<nombre>'
    And match response.precio == <precio>

    Examples:
      | read('productos.csv') |

  Scenario Outline: Nombres leídos de un JSON
    And path 'productos', <id>
    When method get
    Then status 200
    And match response.nombre == '<nombre>'

    Examples:
      | read('casos.json') |
