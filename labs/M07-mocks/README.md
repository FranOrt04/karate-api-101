# M07 — Mocks

[← Página anterior](../M06-data-driven/M06-01-tablas-csv-json.md) · [Siguiente página →](M07-01-karate-start.md)

> [!NOTE]
> **Cómo funciona este módulo.** Primero la **teoría**, luego la **demostración guiada** del formador, y después **practicas tú** en el laboratorio.

## Qué aprenderás

- Un mock de Karate **es un feature** con `pathMatches` / `methodIs`.
- `karate.start('...feature')` devuelve `{ port }`.
- El mock de tienda del curso (`mock/tienda.feature`) vs un mock **ad hoc** en el propio lab.

## Teoría

Desde M01 los tests hablan con la tienda que arranca `karate-config.js`. Eso es un mock **de suite**. En M07 arrancas otro mock **dentro del Scenario** para una API de pedidos que no existe en la tienda.

| Idea | Tienda (`mock/`) | Pedidos (este módulo) |
|------|------------------|------------------------|
| Cuándo arranca | `callSingle` en config | `Background` del feature M07 |
| Puerto | aleatorio, `baseUrl` | aleatorio, `url 'http://localhost:' + mock.port` |
| Rutas | `/productos`, `/usuarios` | `/pedidos/{id}` |

El Scenario del mock no es Given/When/Then de negocio: la condición es `pathMatches('/pedidos/{id}') && methodIs('get')`. El cuerpo se asigna a `response`.

> [!NOTE]
> `pathParams.id` en el mock llega como **string**. Por eso el feature de prueba hace `match response.id == '77'` (comillas). Si haces `parseInt` en el mock, podrías comparar número.

Codespaces puede listar el puerto en **Ports**. Los tests ya usan `localhost`; no abras la URL `*.app.github.dev` salvo curiosidad.

## Demostración guiada

> Recorrido que hace el formador en vivo. Tono descriptivo, sin imperativos.

1. `mock/pedidos.feature` define GET `/pedidos/{id}` con `estado: enviado`.
2. `features/m07/pedidos.feature` hace `karate.start` de ese fichero y GET `pedidos/77`.
3. El informe muestra dos servidores en juego si también corre la tienda (config), pero este feature no usa `baseUrl`.

## Ahora practica tú

| Lab | Título | Qué harás |
|-----|--------|-----------|
| M07-01 | [karate.start](M07-01-karate-start.md) | Arrancar el mock de pedidos y añadir una ruta |

→ Empieza por **[M07-01 — karate.start](M07-01-karate-start.md)**.
