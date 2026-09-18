# M06 — Data-driven

[← Página anterior](../M05-reutilizacion/M05-01-call-y-config.md) · [Siguiente página →](M06-01-tablas-csv-json.md)

> [!NOTE]
> **Cómo funciona este módulo.** Primero la **teoría**, luego la **demostración guiada** del formador, y después **practicas tú** en el laboratorio.

## Qué aprenderás

- `Scenario Outline` + `Examples`.
- Cargar la tabla desde un CSV y desde un JSON.

## Teoría

Un Outline es **un Scenario que se repite** por cada fila. `<id>` se sustituye antes de ejecutar.

| Fuente | Dónde | Cuándo |
|--------|-------|--------|
| Tabla embebida | Bajo `Examples:` en el feature | Pocos casos, se leen en clase |
| CSV | `Examples: \| read('productos.csv') \|` | Mismos campos, más filas |
| JSON | `Examples: \| read('casos.json') \|` | Datos ya vienen como lista de objetos |

Las columnas del CSV **tienen que coincidir** con los placeholders (`<id>`, `<nombre>`, `<precio>`).

> [!WARNING]
> El CSV va junto al feature (`features/m06/productos.csv`) y se lee con path **relativo** al feature, no con `classpath:` en este lab.

## Demostración guiada

> Recorrido que hace el formador en vivo. Tono descriptivo, sin imperativos.

1. `tabla.feature` recorre tres productos. En el informe aparecen tres filas, no un solo Scenario.
2. `ficheros.feature` lee `productos.csv` y `casos.json`. El Outline de precios comprueba `response.precio == <precio>` (número, sin comillas).
3. Un fallo en la fila 2 deja las otras en verde: se ve qué dato rompió.

## Ahora practica tú

| Lab | Título | Qué harás |
|-----|--------|-----------|
| M06-01 | [Tablas, CSV y JSON](M06-01-tablas-csv-json.md) | Ejecutar outlines y añadir una fila |

→ Empieza por **[M06-01 — Tablas, CSV y JSON](M06-01-tablas-csv-json.md)**.
