# M03-02 — POST PUT PATCH DELETE

[← Página anterior](M03-01-get-path-params.md) · [Siguiente página →](../M04-validaciones/README.md)

> El concepto está en el [README del módulo](README.md). Aquí lo montas tú.

### Objetivo

Vas a escribir los cuatro verbos de escritura y comprobar que el mock **no persiste**.

### Prerrequisitos

- M03-01 hecho.

### En qué consiste

Vas a crear `features/m03/write.feature` (tags `@m03 @http-write`).

### 1 — POST

**Acción:** Background con `url baseUrl` y `header Content-Type = 'application/json'`. Scenario POST a `productos` con `{ nombre: 'Dock USB', precio: 60, categoria: 'periferico', stock: 5 }`. Espera `201`, `id == 99`, `nombre == 'Dock USB'`.

**Por qué:** El mock siempre asigna id 99. Asera el **response del POST**, no un GET posterior.

**Resultado esperado:** `@http-write` → 1 verde.

### 2 — PUT, PATCH, DELETE

**Acción:**

- PUT `productos/1` con un teclado mecánico (precio 90, stock 3) → 200 y el nombre nuevo.
- PATCH `productos/3` solo `{ stock: 1 }` → 200, `stock == 1`, `id == 3`.
- DELETE `productos/2` → **204**.

**Resultado esperado:** 4 escenarios verdes.

### 3 — El catálogo no cambió

**Acción:** Lanza `@http-get` otra vez (sin tocar `write.feature`).

**Por qué:** El `Background` del mock recarga la lista en cada petición.

**Resultado esperado:** el listado sigue teniendo 3 productos (Teclado, Monitor, Webcam).

## Comprueba tu entendimiento

**Header**

Quita el `Content-Type` del Background, lanza `@http-write`, y vuélvelo a poner.

→ En este mock suele colar. En APIs reales, no.

## Reto

### 1 — POST sin `precio`

Cuerpo `{ nombre: 'Cable', categoria: 'periferico', stock: 20 }`. ¿Qué pones en el `match` de `precio`?

<details>
<summary>Ver solución</summary>

`match response.precio == '#null'` y `status 201`.

Si quieres contrastar, en `example` está `src/test/java/features/m03/write.feature`.

</details>

## Errores frecuentes

| Síntoma | Causa probable | Cómo arreglarlo |
|---------|----------------|-----------------|
| Esperabas 4 productos tras el POST | El mock no guarda estado | Asera el response del POST |
| DELETE con 200 | Este mock responde 204 | `status 204` |
