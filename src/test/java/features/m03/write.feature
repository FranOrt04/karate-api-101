@m03 @http-write
Feature: POST PUT PATCH DELETE contra la tienda

  Background:
    Given url baseUrl
    And header Content-Type = 'application/json'

  Scenario: Crear un producto
    And path 'productos'
    And request { nombre: 'Dock USB', precio: 60, categoria: 'periferico', stock: 5 }
    When method post
    Then status 201
    And match response.id == 99
    And match response.nombre == 'Dock USB'
    And match response.precio == 60

  Scenario: Reemplazar un producto
    And path 'productos', 1
    And request { nombre: 'Teclado mecanico', precio: 90, categoria: 'periferico', stock: 3 }
    When method put
    Then status 200
    And match response.nombre == 'Teclado mecanico'
    And match response.id == 1

  Scenario: Actualizar solo el stock
    And path 'productos', 3
    And request { stock: 1 }
    When method patch
    Then status 200
    And match response.stock == 1
    And match response.id == 3

  Scenario: Borrar un producto
    And path 'productos', 2
    When method delete
    Then status 204
