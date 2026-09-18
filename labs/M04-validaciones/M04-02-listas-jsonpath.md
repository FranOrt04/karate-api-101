# M04-02 — Listas y JSONPath

[← Página anterior](M04-01-match-y-esquema.md) · [Siguiente página →](../M05-reutilizacion/README.md)

> Práctica del módulo. La teoría y la demo están en el [README del módulo](README.md).

### Objetivo

Validar un array entero con `match each` y localizar un valor con JSONPath.

### Prerrequisitos

- M04-01 hecho.

### En qué consiste

Ejecutas `listas.feature` y añades una aserción sobre precios.

### 1 — Correr listas

**Acción:**

```bash
mvn test -Dkarate.options="--tags @listas"
```

**Por qué:** El GET `/productos` devuelve tres objetos; `match each` aplica el esquema a los tres.

**Resultado esperado:** 3 escenarios verdes.

### 2 — Leer JSONPath

**Acción:** En el informe del Scenario *JSONPath sobre la lista*, observa que no se recorre la lista a mano.

**Por qué:** `response[*].id` es «todos los ids». `contains 2` busca el Monitor.

**Resultado esperado:** en el log no hay bucle; un solo match.

### 3 — Contains de un nombre

**Acción:** Añade al último Scenario:

```gherkin
And match response[*].nombre contains 'Webcam'
```

**Por qué:** Misma idea, otro campo.

**Resultado esperado:** verde.

## Comprueba tu entendimiento

**Longitud**

Cambia `'#[3]'` por `'#[4]'` y relanza.

→ Rojo. El mock tiene tres productos.

## Reto

### 1 — Cada stock es número positivo

Usa `match each` solo sobre `stock` (puedes extraer la lista).

<details>
<summary>Ver solución</summary>

```gherkin
And match each response[*].stock == '#number'
And match each response[*].stock == '#? _ > 0'
```

`#? _ > 0` es un predicado de Karate sobre el valor actual `_`. Si se te atraganta, deja el `'#number'` y el `assert` del lab anterior.

</details>

## Errores frecuentes

| Síntoma | Causa probable | Cómo arreglarlo |
|---------|----------------|-----------------|
| `match each` sobre un objeto | Aplicaste `each` a `/productos/1` | `each` es para **arrays** |
| JSONPath vacío | Escribiste `response.id[*]` | `response[*].id` |
