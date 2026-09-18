# M04-02 — Listas y JSONPath

[← Página anterior](M04-01-match-y-esquema.md) · [Siguiente página →](../M05-reutilizacion/README.md)

> El concepto está en el [README del módulo](README.md). Aquí lo montas tú.

### Objetivo

Vas a validar un array con `match each` y localizar un valor con JSONPath.

### Prerrequisitos

- M04-01 hecho.

### En qué consiste

Vas a crear `features/m04/listas.feature` (tags `@m04 @listas`).

### 1 — Tamaño y esquema de cada elemento

**Acción:** Background GET `productos` 200. Scenario: `response == '#[3]'` y `[0].nombre == 'Teclado'`. Otro: `match each response ==` el mismo esquema de cinco campos de M04-01.

**Resultado esperado:** `@listas` → 2 verdes.

### 2 — JSONPath

**Acción:** Scenario con `response[*].id contains 2` y `response[*].categoria contains 'pantalla'`. Añade `response[*].nombre contains 'Webcam'`.

**Resultado esperado:** 3 verdes.

## Comprueba tu entendimiento

Cambia `'#[3]'` por `'#[4]'` → rojo. Restaura.

## Reto

### 1 — Cada stock es número positivo

<details>
<summary>Ver solución</summary>

```gherkin
And match each response[*].stock == '#number'
And match each response[*].stock == '#? _ > 0'
```

Si quieres contrastar, en `example` está `features/m04/listas.feature`.

</details>

## Errores frecuentes

| Síntoma | Causa probable | Cómo arreglarlo |
|---------|----------------|-----------------|
| `match each` sobre un objeto | Lo aplicaste a `/productos/1` | `each` es para arrays |
| JSONPath vacío | `response.id[*]` | `response[*].id` |
