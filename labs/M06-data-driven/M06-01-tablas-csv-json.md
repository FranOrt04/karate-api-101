# M06-01 — Tablas, CSV y JSON

[← Página anterior](README.md) · [Siguiente página →](../M07-mocks/README.md)

> Práctica del módulo. La teoría y la demo están en el [README del módulo](README.md).

### Objetivo

Repetir el mismo GET con tres fuentes de datos: tabla, CSV y JSON.

### Prerrequisitos

- M05 hecho.

### En qué consiste

Ejecutas los dos features `@m06` y amplías el CSV.

### 1 — Tabla embebida

**Acción:**

```bash
mvn test -Dkarate.options="--tags @ddt-tabla"
```

**Por qué:** Tres filas, tres requests a `/productos/1|2|3`.

**Resultado esperado:** 3 escenarios (el Outline se expande).

### 2 — CSV y JSON

**Acción:**

```bash
mvn test -Dkarate.options="--tags @ddt-ficheros"
```

**Por qué:** Misma idea, datos fuera del Gherkin.

**Resultado esperado:** 3 filas del CSV + 2 del JSON, todas verdes.

### 3 — Romper una fila

**Acción:** En `productos.csv` cambia el precio del Monitor de `180` a `1`. Relanza `@ddt-ficheros`.

**Por qué:** El informe marca **solo** esa fila.

**Resultado esperado:** fallo en id 2. Restaura `180`.

## Comprueba tu entendimiento

**Comillas en precio**

Si en la tabla embebida escribes `And match response.precio == '<precio>'` (con comillas) y el valor es número…

→ Karate compara string `"25"` con número `25` y falla. Los números van **sin** comillas en el `match`.

## Reto

### 1 — Una fila más

El mock solo tiene ids 1, 2 y 3. Añadir id 4 al CSV **debe** fallar. Hazlo, mira el 404, y quita la fila.

<details>
<summary>Ver solución</summary>

El Outline espera `status 200`. Un id 4 recibe 404 → esa fila roja. Para datos 404 haría falta otro Outline (o una columna `status`). En 101 nos quedamos con el catálogo conocido.

</details>

## Errores frecuentes

| Síntoma | Causa probable | Cómo arreglarlo |
|---------|----------------|-----------------|
| `read` no encuentra el CSV | Lo pusiste en otra carpeta | Junto a `ficheros.feature` |
| Todas las filas fallan | Cabecera CSV distinta de `<placeholders>` | `id,nombre,precio` tal cual |
| JSON no expande | No es un array de objetos | Mira `casos.json`: lista `[ {...}, {...} ]` |
