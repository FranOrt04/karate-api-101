# M05-01 — call y config

[← Página anterior](README.md) · [Siguiente página →](../M06-data-driven/README.md)

> Práctica del módulo. La teoría y la demo están en el [README del módulo](README.md).

### Objetivo

Reutilizar un GET con `call` sin duplicar `url` / `path`.

### Prerrequisitos

- M04 hecho.

### En qué consiste

Creas el helper y el feature que lo llama.

### 1 — Helper

**Acción:** Crea `src/test/java/features/helpers/get-producto.feature` con `@ignore`. Un Scenario: `url baseUrl`, `path 'productos', id`, GET, `status 200`. No pongas un `id` literal: lo recibe el `call`.

**Por qué:** Sin `@ignore`, el suite intenta ejecutarlo y `id` no existe.

**Resultado esperado:** el fichero existe. `mvn test` no lo cuenta como test.

### 2 — call.feature

**Acción:** Crea `features/m05/call.feature` tag `@m05`. Scenario: `call read('classpath:features/helpers/get-producto.feature') { id: 2 }` y `match` de `nombre == 'Monitor'`. Otro Scenario igual con id 1 y `Teclado`.

**Resultado esperado:** `mvn test -Dkarate.options="--tags @m05"` → 2 verdes. El helper no sale como feature independiente en el summary.

### 3 — Helper de usuario

**Acción:** Copia el patrón a `get-usuario.feature`. Un tercer Scenario en `call.feature` con `{ id: 1 }` y `nombre == 'Ana'`.

**Resultado esperado:** 3 verdes.

## Comprueba tu entendimiento

Si `callSingle` del mock en `karate-config.js` fallara, todos los features HTTP se caen. M02 no usa `baseUrl`.

## Reto

### 1 — GET 404 reutilizado

El helper actual exige 200. ¿Cómo pruebas `productos/999`?

<details>
<summary>Ver solución</summary>

No uses ese helper. GET explícito en el Scenario, o un segundo helper sin aserción de status.

Referencia: `example` → `features/m05/call.feature`. Extra: `examples/m05-call-tabla.feature`.

</details>

## Errores frecuentes

| Síntoma | Causa probable | Cómo arreglarlo |
|---------|----------------|-----------------|
| `id is not defined` | Helper sin `@ignore` / sin `call` | `@ignore` + `{ id: n }` |
| `read` no encuentra el fichero | Path relativo mal | `classpath:features/helpers/get-producto.feature` |
