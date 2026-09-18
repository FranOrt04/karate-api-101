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

Cuando copias el mismo GET en tres features, el helper es un `.feature` con variables de entrada. `call` lo ejecuta y te devuelve un objeto con `response`, `responseStatus`, etc.

| Pieza | Rol |
|-------|-----|
| `features/helpers/get-producto.feature` | GET `/productos/{id}`; espera 200 |
| `@ignore` | Karate no lo corre en el suite |
| `call read('classpath:features/helpers/get-producto.feature') { id: 2 }` | Pasa `id` |
| `karate-config.js` | Config **global** (env, `baseUrl`); no sustituye a `call` |

> [!NOTE]
> `call` reutiliza **escenarios**. `karate-config.js` reutiliza **configuración**. No mezcles las dos ideas.

## Demostración guiada

> Recorrido que hace el formador en vivo. Tono descriptivo, sin imperativos.

1. El helper no tiene `url` hardcodeada: usa `baseUrl` y `path 'productos', id`.
2. `call.feature` llama dos veces, con id 2 y 1, y hace `match` sobre `llamado.response.nombre`.
3. Sin `@ignore`, el helper fallaría al ejecutarse solo: `id` no estaría definido.

## Ahora practica tú

| Lab | Título | Qué harás |
|-----|--------|-----------|
| M05-01 | [call y config](M05-01-call-y-config.md) | Ejecutar call y extraer un helper de usuario |

→ Empieza por **[M05-01 — call y config](M05-01-call-y-config.md)**.
