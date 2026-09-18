# M07 — Mocks

[← Página anterior](../M06-data-driven/M06-01-tablas-csv-json.md) · [Siguiente página →](M07-01-karate-start.md)

> [!NOTE]
> **Cómo funciona este módulo.** Primero la **teoría**, luego la **demostración guiada** del formador, y después **practicas tú** en el laboratorio.

## Qué aprenderás

- Un mock de Karate **es un feature** con `pathMatches` / `methodIs`.
- `karate.start('...feature')` devuelve `{ port }`.
- El mock de tienda del curso vs un mock **ad hoc** de pedidos que escribes tú.

## Teoría

Desde M01 los tests hablan con la tienda que arranca `karate-config.js`. En M07 arrancas **otro** mock dentro del feature, para una API de pedidos que no está en la tienda.

| Idea | Tienda (`mock/tienda.feature`) | Pedidos (este módulo) |
|------|--------------------------------|------------------------|
| Cuándo arranca | `callSingle` en config | `Background` de **tu** feature |
| Puerto | aleatorio, `baseUrl` | aleatorio, `url 'http://localhost:' + mock.port` |
| Quién lo escribe | Ya viene | **Tú** |

El Scenario del mock no es Given/When/Then de negocio: la condición es `pathMatches('/pedidos/{id}') && methodIs('get')`. El cuerpo se asigna a `response`.

> [!NOTE]
> `pathParams.id` llega como **string**. `match response.id == '77'` (con comillas) o `parseInt` en el mock.

El catch-all (`Scenario:` vacío al final) tiene que ser **el último**.

## Demostración guiada

> Rama [`example`](https://github.com/my-it-labs/karate-api-101/tree/example).

1. `mock/pedidos.feature` — GET `/pedidos/{id}`, POST `/pedidos`, catch-all 404.
2. `features/m07/pedidos.feature` — `karate.start` + GET 77 + POST.
3. Extra: `examples/m07-catch-all.feature` (GET `/foo` → 404).

## Ahora practica tú

| Lab | Título | Qué harás |
|-----|--------|-----------|
| M07-01 | [karate.start](M07-01-karate-start.md) | **Crear** mock de pedidos y el feature cliente |

→ Empieza por **[M07-01 — karate.start](M07-01-karate-start.md)**.
