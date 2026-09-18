function fn() {
  var mock = karate.start('classpath:mock/tienda.feature');
  karate.log('mock tienda escuchando en http://localhost:' + mock.port);
  return mock;
}
