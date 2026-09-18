# M03-01 — GET, path y params

[← Página anterior](README.md) · [Siguiente página →](M03-02-post-put-patch-delete.md)

> El concepto está en el [README del módulo](README.md). Aquí lo montas tú.

### Objetivo

Vas a escribir GET contra la tienda con `path` y `param`, y cubrir 200 y 404.

### Prerrequisitos

- M01 y M02 hechos.

### En qué consiste

Vas a crear `features/m03/get.feature` y ir añadiendo escenarios, ejecutando `@http-get` cada vez.

### 1 — Listar productos

**Acción:** Crea `src/test/java/features/m03/get.feature` con tags `@m03 @http-get`. `Background`: `Given url baseUrl`. Primer Scenario: `path 'productos'`, GET, `200`, lista de 3, el `[0].id` es 1.

**Por qué:** Mismo mock que el smoke, pero ahora el feature es de este módulo.

**Resultado esperado:** `mvn test -Dkarate.options="--tags @http-get"` → 1 escenario verde.

### 2 — Path y query

**Acción:** Añade un Scenario que pida el producto `2` y compruebe `nombre == 'Monitor'` y `categoria == 'pantalla'`. Otro que filtre `param categoria = 'periferico'` y espere **2** elementos, todos con esa categoría (`match each … contains`).

**Por qué:** `path` concatena segmentos; `param` va a la query. Orden: path y param **antes** de `method get`.

**Resultado esperado:** 3 escenarios verdes.

### 3 — 404

**Acción:** GET `productos/999`. Status `404` y `response.mensaje == 'Producto no encontrado'`.

**Por qué:** Un GET que no existe no es un fallo del test si lo asertas.

**Resultado esperado:** 4 escenarios verdes. En el informe, el path 2 muestra el JSON del Monitor.

### 4 — Usuario

**Acción:** Scenario GET `usuarios/1`, `nombre == 'Ana'`.

**Resultado esperado:** 5 escenarios verdes.

## Comprueba tu entendimiento

**404 de usuario**

GET `usuarios/9` → `404` y mensaje `Usuario no encontrado`.

## Reto

### 1 — Filtro vacío

`param categoria = 'audio'`. ¿200 con lista vacía o 404?

<details>
<summary>Ver solución</summary>

200 y `response == '#[0]'`. El mock filtra; no hay categoría `audio`.

Si quieres contrastar, en `example` está `src/test/java/features/m03/get.feature`.

</details>

## Errores frecuentes

| Síntoma | Causa probable | Cómo arreglarlo |
|---------|----------------|-----------------|
| `404 Ruta no mockeada` | `path '/productos'` | `path 'productos'` |
| Connection refused | Host escrito a mano | `url baseUrl` |
| El filtro devuelve 3 | El param va después del GET | `param` antes de `method get` |
