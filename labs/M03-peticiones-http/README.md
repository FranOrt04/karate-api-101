# M03 — Peticiones HTTP

[← Página anterior](../M02-introduccion-karate/M02-01-dsl-variables-match.md) · [Siguiente página →](M03-01-get-path-params.md)

> [!NOTE]
> **Cómo funciona este módulo.** Primero la **teoría**, luego la **demostración guiada** del formador, y después **practicas tú** en los laboratorios.

## Qué aprenderás

- `url`, `path`, `param` y `header`.
- `method get` / `post` / `put` / `patch` / `delete`.
- `request` para el cuerpo y `status` para el código HTTP.
- Por qué el `path` **no** lleva barra inicial cuando se concatena.

## Teoría

El Background de los features HTTP hace `Given url baseUrl`. `baseUrl` lo inyecta `karate-config.js` hacia el mock de tienda.

| Paso | Efecto |
|------|--------|
| `url baseUrl` | Host y puerto del mock |
| `path 'productos', 2` | `/productos/2` |
| `param categoria = 'periferico'` | `?categoria=periferico` |
| `request { ... }` | Cuerpo JSON |
| `method post` | Dispara la petición |
| `status 201` | Aserción del código |

> [!WARNING]
> `path '/productos'` (con `/` inicial) **rompe** la concatenación. Usa `path 'productos'`.

`GET` no lleva `request`. `DELETE` en este mock responde `204` y cuerpo vacío. El mock **no persiste**: un POST no cambia el GET posterior.

Catálogo fijo: id 1 Teclado (periferico, 25), id 2 Monitor (pantalla, 180), id 3 Webcam (periferico, 45). Usuaria id 1 Ana (ops); id 2 Luis (dev).

## Demostración guiada

> Rama [`example`](https://github.com/my-it-labs/karate-api-101/tree/example).

1. `features/m03/get.feature`: listado, path, query param, 404 del id 999.
2. `features/m03/write.feature`: POST id 99 fijo, PUT, PATCH de stock, DELETE 204.
3. Extra: `examples/m03-cabeceras.feature` (`header` / `headers`).

## Ahora practica tú

| Lab | Título | Qué harás |
|-----|--------|-----------|
| M03-01 | [GET, path y params](M03-01-get-path-params.md) | **Crear** `get.feature` |
| M03-02 | [POST PUT PATCH DELETE](M03-02-post-put-patch-delete.md) | **Crear** `write.feature` |

→ Empieza por **[M03-01 — GET, path y params](M03-01-get-path-params.md)**.
