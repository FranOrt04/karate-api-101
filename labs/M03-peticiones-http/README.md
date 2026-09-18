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

El Background de los features HTTP hace `Given url baseUrl`. `baseUrl` lo inyecta `karate-config.js` hacia el mock de tienda. Tú no pones `https://jsonplaceholder...`: el laboratorio no depende de internet.

| Paso | Efecto |
|------|--------|
| `url baseUrl` | Host y puerto del mock |
| `path 'productos', 2` | `/productos/2` |
| `param categoria = 'periferico'` | `?categoria=periferico` |
| `request { ... }` | Cuerpo JSON |
| `method post` | Dispara la petición |
| `status 201` | Aserción del código |

> [!WARNING]
> `path '/productos'` (con `/` inicial) **rompe** la concatenación y suele producir `//productos` o ignorar el host. Usa `path 'productos'`.

`GET` no lleva `request`. `DELETE` en este mock responde `204` y cuerpo vacío.

## Demostración guiada

> Recorrido que hace el formador en vivo. Tono descriptivo, sin imperativos.

1. En `features/m03/get.feature` el Background fija `url baseUrl`. El primer Scenario lista `/productos` y espera tres elementos.
2. El Scenario del path `productos, 2` devuelve el Monitor. El de `param categoria` deja dos periféricos. El id `999` responde 404.
3. En `write.feature` un POST crea `Dock USB` con id `99` (el mock no persiste: es una respuesta fija). PUT / PATCH / DELETE cubren el resto de verbos.
4. `mvn test -Dkarate.options="--tags @m03"` ejecuta ambos features.

## Ahora practica tú

| Lab | Título | Qué harás |
|-----|--------|-----------|
| M03-01 | [GET, path y params](M03-01-get-path-params.md) | Leer y ampliar los GET |
| M03-02 | [POST PUT PATCH DELETE](M03-02-post-put-patch-delete.md) | Escribir verbos y un header |

→ Empieza por **[M03-01 — GET, path y params](M03-01-get-path-params.md)**.
