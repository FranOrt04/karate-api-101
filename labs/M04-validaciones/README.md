# M04 — Validaciones

[← Página anterior](../M03-peticiones-http/M03-02-post-put-patch-delete.md) · [Siguiente página →](M04-01-match-y-esquema.md)

> [!NOTE]
> **Cómo funciona este módulo.** Primero la **teoría**, luego la **demostración guiada** del formador, y después **practicas tú** en los laboratorios.

## Qué aprenderás

- `match` de igualdad, `contains` y marcadores `#string` / `#number`.
- Esquemas de objeto y `match each` sobre listas.
- JSONPath corto: `response[*].id`.

## Teoría

Hasta ahora el `match` comprobaba un campo. En APIs reales quieres la **forma**.

| Expresión | Significado |
|-----------|-------------|
| `match response.nombre == 'Teclado'` | Valor exacto |
| `match response contains { id: 1 }` | Subconjunto de campos |
| `match response == { id: '#number', nombre: '#string', ... }` | Esquema del objeto |
| `match each response == { ... }` | El mismo esquema para **cada** elemento |
| `match response == '#[3]'` | Array de longitud 3 |
| `match response[*].id contains 2` | JSONPath: la lista de ids incluye 2 |

> [!NOTE]
> `contains` no exige que el objeto tenga *solo* esos campos. El esquema con `== { ... }` sí exige **exactamente** esas claves.

## Demostración guiada

> Rama [`example`](https://github.com/my-it-labs/karate-api-101/tree/example).

1. `features/m04/match.feature`: GET `/productos/1` en el Background; igualdad, `contains`, esquema de cinco campos.
2. `features/m04/listas.feature`: `match each` + `response[*].categoria`.
3. Extra: `examples/m04-predicados.feature` (`#? _ > 0`).

## Ahora practica tú

| Lab | Título | Qué harás |
|-----|--------|-----------|
| M04-01 | [match y esquema](M04-01-match-y-esquema.md) | **Crear** `match.feature` |
| M04-02 | [Listas y JSONPath](M04-02-listas-jsonpath.md) | **Crear** `listas.feature` |

→ Empieza por **[M04-01 — match y esquema](M04-01-match-y-esquema.md)**.
