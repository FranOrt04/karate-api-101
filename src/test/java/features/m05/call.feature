@m05
Feature: Reutilizar un escenario con call

  Scenario: call pasa el id y devuelve la respuesta
    * def llamado = call read('classpath:features/helpers/get-producto.feature') { id: 2 }
    * match llamado.response.nombre == 'Monitor'
    * match llamado.response.id == 2

  Scenario: call otra vez con otro id
    * def llamado = call read('classpath:features/helpers/get-producto.feature') { id: 1 }
    * match llamado.response.nombre == 'Teclado'
