# M04-01 — match y esquema

[← Página anterior](README.md) · [Siguiente página →](M04-02-listas-jsonpath.md)

> Práctica del módulo. La teoría y la demo están en el [README del módulo](README.md).

### Objetivo

Validar un JSON con igualdad, `contains` y un esquema de tipos.

### Prerrequisitos

- M03 hecho.

### En qué consiste

Ejecutas `match.feature` y escribes el esquema de `/usuarios/1`.

### 1 — Correr match

**Acción:**

```bash
mvn test -Dkarate.options="--tags @validaciones"
```

**Por qué:** Tres escenarios sobre el mismo GET de Teclado.

**Resultado esperado:** verde.

### 2 — Romper el esquema

**Acción:** En el Scenario *El documento completo respeta el esquema*, añade un campo inventado al objeto esperado, por ejemplo `color: '#string'`. Relanza.

**Por qué:** `match response == { ... }` es estricto en claves.

**Resultado esperado:** fallo. Karate indica que `color` no está en el actual. Quita `color` y vuelve a verde.

### 3 — Esquema de usuaria

**Acción:** Crea un Scenario nuevo en el mismo feature (o uno nuevo) que haga GET `usuarios/1` y valide:

```text
id number, nombre string, rol string, activo boolean
```

**Por qué:** El mismo patrón cambia de recurso. `activo` es `#boolean`.

**Resultado esperado:** verde con el esquema de Ana.

## Comprueba tu entendimiento

**contains vs ==**

`match response contains { nombre: 'Teclado' }` frente a listar las cinco claves con `==`.

→ `contains` ignora el resto de campos. `==` con objeto no.

## Reto

### 1 — Precio como rango mental

No hay matcher de «precio > 0» en una sola palabra en 101. Usa un `match` de tipo y un `assert` JS:

<details>
<summary>Ver solución</summary>

```gherkin
And match response.precio == '#number'
And assert response.precio > 0
```

`assert` evalúa JavaScript. Úsalo poco: `match` se lee mejor en el informe.

</details>

## Errores frecuentes

| Síntoma | Causa probable | Cómo arreglarlo |
|---------|----------------|-----------------|
| Fallo `expected: #string, actual: 25` | Marcaste `precio` como `'#string'` | `'#number'` |
| El Background ya hizo GET de producto y tú pides usuario | El `path` del Background se queda pegado | En el Scenario de usuario: `Given url baseUrl` otra vez y `path 'usuarios', 1` |
