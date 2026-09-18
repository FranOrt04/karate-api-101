# M01-02 — Config y humo

[← Página anterior](M01-01-proyecto-maven.md) · [Siguiente página →](../M02-introduccion-karate/README.md)

> Práctica del módulo. La teoría y la demo están en el [README del módulo](README.md).

### Objetivo

Enchufar el mock de tienda (ya está en `mock/`) con `karate-config.js` y pasar un GET de humo.

### Prerrequisitos

- M01-01: `mvn test` verde con `hola.feature`.

### En qué consiste

Escribes `karate-config.js` (Karate lo carga solo) y `smoke.feature`.

### 1 — Qué hay en `mock/`

**Acción:** Abre `src/test/java/mock/tienda.feature` y `mock/start.js`. Localiza `karate.start` y las rutas `/productos` y `/usuarios`.

**Por qué:** No reescribes la API. Solo la arrancas una vez por ejecución.

**Resultado esperado:** ves productos Teclado, Monitor, Webcam. `start.js` devuelve el objeto del mock (con `.port`).

### 2 — karate-config.js

**Acción:** Crea `src/test/java/karate-config.js`. Tiene que ser una función `fn()` que:

1. Lea `karate.env` (si viene vacío, usa `'dev'`).
2. Haga `karate.callSingle('classpath:mock/start.js')`.
3. Devuelva un objeto config con `env` y `baseUrl: 'http://localhost:' + mock.port`.

**Por qué:** `callSingle` arranca **un** mock para todo el suite. Cada feature HTTP hará `url baseUrl` sin puertos a mano.

**Resultado esperado:** el fichero está junto a `mock/`, no dentro de `features/`. Relanza `mvn test`: el `hola.feature` sigue verde (no usa `baseUrl`) y en el log aparece `mock tienda escuchando en http://localhost:<puerto>`.

### 3 — smoke.feature

**Acción:** Crea `src/test/java/features/smoke.feature` tags `@smoke @m01`. Scenario: `url baseUrl`, `path 'productos'`, GET, `status 200`, lista de 3, `[0].nombre == 'Teclado'`.

```bash
mvn test -Dkarate.options="--tags @smoke"
```

**Por qué:** A partir de M03 todos los GET/POST cuelgan de este `baseUrl`.

**Resultado esperado:** 1 escenario verde. En el informe ves el JSON de tres productos. `mvn test` (sin tags) corre hola + smoke.

## Comprueba tu entendimiento

**Puerto fijo**

Si en el smoke pones `url 'http://localhost:8080'` en vez de `baseUrl`…

→ *connection refused* (el puerto es aleatorio).

## Reto

### 1 — Humo de usuaria

Añade un Scenario GET `usuarios/1` y `nombre == 'Ana'`.

<details>
<summary>Ver solución</summary>

Mismo Background/`url baseUrl`, `path 'usuarios', 1`, `status 200`.

Referencia (no copies hasta haberte atascado): rama `example` → `karate-config.js` y `features/smoke.feature`.

</details>

## Errores frecuentes

| Síntoma | Causa probable | Cómo arreglarlo |
|---------|----------------|-----------------|
| `baseUrl` is not defined | El js no se llama `karate-config.js` o no está en `src/test/java` | Nombre y carpeta exactos |
| Mock no arranca | `callSingle` mal / `start.js` no está | `classpath:mock/start.js` |
| `404 Ruta no mockeada` | `path '/productos'` | `path 'productos'` |
| El hola ahora falla | Error de sintaxis en el config (se carga siempre) | `fn()` debe `return config` |
