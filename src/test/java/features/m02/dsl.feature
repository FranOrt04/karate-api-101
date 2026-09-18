@m02
Feature: DSL de Karate sin HTTP

  Background:
    * def iva = 0.21
    * def conIva = function(precio){ return precio * (1 + iva) }

  Scenario: Variables, tipos y match
    Given def nombre = 'Teclado'
    And def precio = 25
    And def etiquetas = ['periferico', 'usb']
    And def producto = { nombre: 'Teclado', precio: 25, stock: 10 }
    Then match nombre == 'Teclado'
    And match precio == 25
    And match etiquetas == '#array'
    And match etiquetas == '#[2]'
    And match producto == '#object'
    And match producto.nombre == 'Teclado'
    And match producto.stock == '#number'

  Scenario: Función JavaScript en el feature
    When def resultado = conIva(100)
    Then match resultado == 121
