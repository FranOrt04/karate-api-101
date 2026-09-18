# M04-01 — match y esquema

[← Página anterior](README.md) · [Siguiente página →](M04-02-listas-jsonpath.md)

> El concepto está en el [README del módulo](README.md). Aquí lo montas tú.

### Objetivo

Vas a validar un JSON con igualdad, `contains` y un esquema de tipos.

### Prerrequisitos

- M03 hecho.

### En qué consiste

Vas a crear `features/m04/match.feature` (tag `@m04 @validaciones`).

### 1 — Background y igualdad

**Acción:** Background: GET `productos/1` hasta `status 200`. Primer Scenario: `nombre == 'Teclado'`, `precio == 25`, `id == '#number'`.

**Resultado esperado:** `@validaciones` → 1 verde.

### 2 — contains y esquema

**Acción:** Scenario con `match response contains { id: 1, categoria: 'periferico' }`. Otro Scenario donde `response ==` un objeto con exactamente `id`, `nombre`, `precio`, `categoria`, `stock` y marcadores de tipo.

**Por qué:** El esquema rompe si el mock añade un campo. Es deliberado.

**Resultado esperado:** 3 verdes.

### 3 — Romper el esquema

**Acción:** Añade `color: '#string'` al esquema, relanza, mira el fallo, quítalo.

**Resultado esperado:** rojo y otra vez verde.

### 4 — Esquema de usuaria

**Acción:** Un Scenario que haga GET `usuarios/1` (vuelve a poner `url baseUrl` y el `path`; el Background se quedó en productos) y valide `id` number, `nombre` string, `rol` string, `activo` boolean.

**Resultado esperado:** 4 verdes.

## Comprueba tu entendimiento

`contains` vs `==` con objeto: el primero ignora claves de más; el segundo no.

## Reto

### 1 — Precio positivo

`match` de tipo + `assert response.precio > 0`.

<details>
<summary>Ver solución</summary>

```gherkin
And match response.precio == '#number'
And assert response.precio > 0
```

Si quieres contrastar, en `example` está `features/m04/match.feature`.

</details>

## Errores frecuentes

| Síntoma | Causa probable | Cómo arreglarlo |
|---------|----------------|-----------------|
| `precio` como `'#string'` | Marcador equivocado | `'#number'` |
| El GET de usuario sigue yendo a productos | El path del Background se queda | `Given url baseUrl` y `path 'usuarios', 1` en ese Scenario |
