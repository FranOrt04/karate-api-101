# M06 — Data-driven

[← Página anterior](../M05-reutilizacion/M05-01-call-y-config.md) · [Siguiente página →](M06-01-tablas-csv-json.md)

> [!NOTE]
> **Cómo funciona este módulo.** Primero la **teoría**, luego la **demostración guiada** del formador, y después **practicas tú** en el laboratorio.

## Qué aprenderás

- `Scenario Outline` + `Examples`.
- Cargar la tabla desde un CSV y desde un JSON.

## Teoría

Un Outline es **un Scenario que se repite** por cada fila. `<id>` se sustituye antes de ejecutar.

| Fuente | Dónde |
|--------|-------|
| Tabla embebida | Bajo `Examples:` en el feature |
| CSV | `Examples: \| read('productos.csv') \|` |
| JSON | `Examples: \| read('casos.json') \|` |

Las columnas tienen que coincidir con los placeholders. El CSV/JSON van **junto** al feature (path relativo).

Los números en el `match` van **sin** comillas: `response.precio == <precio>`, no `'<precio>'`.

## Demostración guiada

> Rama [`example`](https://github.com/my-it-labs/karate-api-101/tree/example).

1. `features/m06/tabla.feature` — tres productos embebidos.
2. `features/m06/ficheros.feature` + `productos.csv` + `casos.json`.
3. Extra: `examples/m06-usuarios-outline.feature`.

## Ahora practica tú

| Lab | Título | Qué harás |
|-----|--------|-----------|
| M06-01 | [Tablas, CSV y JSON](M06-01-tablas-csv-json.md) | **Crear** outlines y ficheros de datos |

→ Empieza por **[M06-01 — Tablas, CSV y JSON](M06-01-tablas-csv-json.md)**.
