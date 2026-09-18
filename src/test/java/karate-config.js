function fn() {
  var env = karate.env;
  karate.log('karate.env:', env);
  if (!env) {
    env = 'dev';
  }

  var mock = karate.callSingle('classpath:mock/start.js');
  var config = {
    env: env,
    baseUrl: 'http://localhost:' + mock.port
  };
  return config;
}
