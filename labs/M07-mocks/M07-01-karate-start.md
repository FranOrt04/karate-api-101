# M07-01 — karate.start

[← Página anterior](README.md) · [Siguiente página →](../../README.md)

> Práctica del módulo. La teoría y la demo están en el [README del módulo](README.md).

### Objetivo

Escribir un mock propio y un feature que lo arranca. No uses `baseUrl` de la tienda.

### Prerrequisitos

- M06 hecho.

### En qué consiste

Creas `mock/pedidos.feature` y `features/m07/pedidos.feature`.

### 1 — El mock

**Acción:** Crea `src/test/java/mock/pedidos.feature` (junto a `tienda.feature`, **no** bajo `features/`). `configure cors = true`. Un Scenario `pathMatches('/pedidos/{id}') && methodIs('get')` que responda `{ id: el path param, estado: 'enviado', items: 2 }`. Otro `pathMatches('/pedidos') && methodIs('post')` con `201` y `{ id: '88', estado: 'creado' }`. Último Scenario sin condición: `404` y `{ mensaje: 'Pedido no mockeado' }`.

**Por qué:** Si el mock vive bajo `features/`, el runner lo ejecuta como test y los `pathMatches` no tienen sentido.

**Resultado esperado:** el fichero está en `mock/`. Todavía no hay test cliente.

### 2 — El feature cliente

**Acción:** Crea `features/m07/pedidos.feature` tag `@m07`. Background: `def mock = karate.start('classpath:mock/pedidos.feature')` y `url 'http://localhost:' + mock.port`. Scenario GET `pedidos/77` → 200, `id == '77'`, `estado == 'enviado'`. Scenario POST `pedidos` → 201 y `estado == 'creado'`.

**Resultado esperado:** `mvn test -Dkarate.options="--tags @m07"` → 2 verdes.

### 3 — Suite completa

**Acción:** `mvn test` (todo lo que has escrito en el curso).

**Resultado esperado:** 0 failed. Cierre del laboratorio.

## Comprueba tu entendimiento

GET `foo` contra el puerto del mock de pedidos → 404 del catch-all. Extra en `example`: `examples/m07-catch-all.feature`.

## Reto

### 1 — GET con id no es catch-all

`pathMatches('/pedidos/{id}')` casa **cualquier** id. Para un 404 de pedido concreto hay que ramificar en el mock (`id == '0'` → 404). El catch-all cubre rutas como `/foo`.

<details>
<summary>Ver solución</summary>

Referencia: `example` → `mock/pedidos.feature` y `features/m07/pedidos.feature`.

</details>

## Errores frecuentes

| Síntoma | Causa probable | Cómo arreglarlo |
|---------|----------------|-----------------|
| `match id == 77` falla | El mock devuelve string `'77'` | `== '77'` |
| Connection refused | Usaste `baseUrl` de la tienda | `url 'http://localhost:' + mock.port` |
| El POST cae en 404 | Catch-all antes del POST | El `Scenario:` vacío, el último |
| El mock se ejecuta como test | Está bajo `features/` | Déjalo en `mock/` |
