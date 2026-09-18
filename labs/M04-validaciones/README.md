# M04 — Validaciones

[← Página anterior](../M03-peticiones-http/M03-02-post-put-patch-delete.md) · [Siguiente página →](M04-01-match-y-esquema.md)

> [!NOTE]
> **Cómo funciona este módulo.** Primero la **teoría**, luego la **demostración guiada** del formador, y después **practicas tú** en los laboratorios.

## Qué aprenderás

- `match` de igualdad, `contains` y marcadores `#string` / `#number`.
- Esquemas de objeto y `match each` sobre listas.
- JSONPath corto: `response[*].id`.

## Teoría

Hasta ahora el `match` comprobaba un campo. En APIs reales no quieres listar todos los valores literales: quieres la **forma**.

| Expresión | Significado |
|-----------|-------------|
| `match response.nombre == 'Teclado'` | Valor exacto |
| `match response contains { id: 1 }` | Subconjunto de campos |
| `match response == { id: '#number', nombre: '#string', ... }` | Esquema del objeto |
| `match each response == { ... }` | El mismo esquema para **cada** elemento de la lista |
| `match response == '#[3]'` | Array de longitud 3 |
| `match response[*].id contains 2` | JSONPath: la lista de ids incluye 2 |

> [!NOTE]
> `contains` no exige que el objeto tenga *solo* esos campos. El esquema con `== { ... }` sí exige **exactamente** esas claves (salvo que uses `#ignore` / `##...` para opcionales; en 101 no hace falta).

## Demostración guiada

> Recorrido que hace el formador en vivo. Tono descriptivo, sin imperativos.

1. `features/m04/match.feature` reutiliza el GET `/productos/1` en el Background. Los Scenarios solo asertan.
2. El esquema del producto lista cinco campos. Si el mock añadiera `color`, este match rompería: es deliberado.
3. `listas.feature` pide el catálogo y aplica `match each`. `response[*].categoria contains 'pantalla'` localiza el Monitor sin un `for`.

## Ahora practica tú

| Lab | Título | Qué harás |
|-----|--------|-----------|
| M04-01 | [match y esquema](M04-01-match-y-esquema.md) | Esquema de un producto y de un usuario |
| M04-02 | [Listas y JSONPath](M04-02-listas-jsonpath.md) | `match each` y un path |

→ Empieza por **[M04-01 — match y esquema](M04-01-match-y-esquema.md)**.
