# M05-01 — call y config

[← Página anterior](README.md) · [Siguiente página →](../M06-data-driven/README.md)

> Práctica del módulo. La teoría y la demo están en el [README del módulo](README.md).

### Objetivo

Reutilizar un GET con `call` y no duplicar el `url` / `path`.

### Prerrequisitos

- M04 hecho.

### En qué consiste

Ejecutas `call.feature` y creas un helper para usuarios.

### 1 — Correr call

**Acción:**

```bash
mvn test -Dkarate.options="--tags @m05"
```

**Por qué:** Dos escenarios, dos ids, un solo helper.

**Resultado esperado:** verde. El helper **no** aparece como feature independiente en el summary (está `@ignore`).

### 2 — Leer lo que devuelve call

**Acción:** En el informe de *call pasa el id…* mira que hay un request interno a `/productos/2`.

**Por qué:** `call` no es un import estático: **ejecuta** HTTP.

**Resultado esperado:** `Monitor` en el response anidado.

### 3 — Helper de usuario

**Acción:** Copia el patrón a `src/test/java/features/helpers/get-usuario.feature` (`@ignore`, `path 'usuarios', id`). En `call.feature` añade un Scenario que llame con `{ id: 1 }` y compruebe `nombre == 'Ana'`.

**Por qué:** El mismo mecanismo vale para cualquier recurso.

**Resultado esperado:** `@m05` sigue verde con 3 escenarios.

## Comprueba tu entendimiento

**Config**

Abre `karate-config.js`. ¿Qué pasaría si `callSingle` del mock fallara?

→ Todos los features HTTP fallan al resolver `baseUrl`. El DSL de M02 también carga config, pero no usa `baseUrl`.

## Reto

### 1 — call que espera 404

El helper actual hace `Then status 200`. ¿Cómo reutilizas un GET de producto inexistente?

<details>
<summary>Ver solución</summary>

No uses ese helper. O bien un segundo helper sin aserción de status, o el GET en el propio Scenario:

```gherkin
Given url baseUrl
And path 'productos', 999
When method get
Then status 404
```

`call` es para el camino feliz que repites. Los 404 suelen ser explícitos.

</details>

## Errores frecuentes

| Síntoma | Causa probable | Cómo arreglarlo |
|---------|----------------|-----------------|
| `id is not defined` en el helper | Lo corriste sin `call` / sin `@ignore` | Tag `@ignore` y llámalo con `{ id: n }` |
| `read` no encuentra el fichero | Path relativo mal | `classpath:features/helpers/get-producto.feature` |
| El helper se cuenta como test fallido | Falta `@ignore` | Primera línea del helper: `@ignore` |
