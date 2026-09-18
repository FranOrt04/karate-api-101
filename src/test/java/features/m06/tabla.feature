@m06 @ddt-tabla
Feature: Data-driven con tabla embebida

  Background:
    Given url baseUrl

  Scenario Outline: Productos conocidos por id
    And path 'productos', <id>
    When method get
    Then status 200
    And match response.nombre == '<nombre>'
    And match response.categoria == '<categoria>'

    Examples:
      | id | nombre  | categoria  |
      | 1  | Teclado | periferico |
      | 2  | Monitor | pantalla   |
      | 3  | Webcam  | periferico |
