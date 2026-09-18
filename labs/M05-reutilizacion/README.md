# M05 — Reutilización (`call`)

[← Página anterior](../M04-validaciones/M04-02-listas-jsonpath.md) · [Siguiente página →](M05-01-call-y-config.md)

> [!NOTE]
> **Cómo funciona este módulo.** Primero la **teoría**, luego la **demostración guiada** del formador, y después **practicas tú** en el laboratorio.

## Qué aprenderás

- Extraer un Scenario a un feature helper.
- `call read('...') { id: 2 }` y leer `llamado.response`.
- El tag `@ignore` para que el helper **no** se ejecute como test suelto.
- Qué hace `karate-config.js` (ya lo usas: `baseUrl`).

## Teoría

Cuando copias el mismo GET en tres features, el helper es un `.feature` con variables de entrada. `call` lo ejecuta y te devuelve un objeto con `response`.

| Pieza | Rol |
|-------|-----|
| Helper GET `/productos/{id}` | Espera 200 |
| `@ignore` | Karate no lo corre en el suite |
| `call read('classpath:features/helpers/get-producto.feature') { id: 2 }` | Pasa `id` |
| `karate-config.js` | Config **global**; no sustituye a `call` |

## Demostración guiada

> Rama [`example`](https://github.com/my-it-labs/karate-api-101/tree/example).

1. `features/helpers/get-producto.feature` (`@ignore`) usa `baseUrl` y `path 'productos', id`.
2. `features/m05/call.feature` llama dos veces (ids 2 y 1).
3. Extra: `examples/m05-call-tabla.feature` — `call` con una **lista** de ids.

## Ahora practica tú

| Lab | Título | Qué harás |
|-----|--------|-----------|
| M05-01 | [call y config](M05-01-call-y-config.md) | **Crear** helper + `call.feature` |

→ Empieza por **[M05-01 — call y config](M05-01-call-y-config.md)**.
