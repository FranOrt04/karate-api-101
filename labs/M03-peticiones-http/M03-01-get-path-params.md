# M03-01 — GET, path y params

[← Página anterior](README.md) · [Siguiente página →](M03-02-post-put-patch-delete.md)

> Práctica del módulo. La teoría y la demo están en el [README del módulo](README.md).

### Objetivo

Lanzar GET contra la tienda usando `path` y `param`, y leer status 200 y 404.

### Prerrequisitos

- M01 y M02 hechos.

### En qué consiste

Ejecutas `get.feature` y añades un GET de usuario.

### 1 — Correr los GET

**Acción:**

```bash
mvn test -Dkarate.options="--tags @http-get"
```

**Por qué:** El tag `@http-get` aísla `get.feature` sin mezclar POST.

**Resultado esperado:** 4 escenarios verdes (listado, path, filtro, 404).

### 2 — Inspeccionar un request

**Acción:** Abre el informe HTML del run y entra en *Obtener un producto por path*.

**Por qué:** Ahí ves la URL final (`.../productos/2`) y el JSON de Monitor.

**Resultado esperado:** `nombre` = `Monitor`, `categoria` = `pantalla`.

### 3 — GET de usuario

**Acción:** Al final de `get.feature` añade un Scenario que pida `usuarios/1` y compruebe que `nombre` es `Ana`.

**Por qué:** El mock también expone `/usuarios/{id}`. Mismo patrón, otro recurso.

**Resultado esperado:** al relanzar `@http-get`, 5 escenarios verdes.

```gherkin
Scenario: Obtener una usuaria
  And path 'usuarios', 1
  When method get
  Then status 200
  And match response.nombre == 'Ana'
```

## Comprueba tu entendimiento

**404 de usuario**

GET a `usuarios/9`

→ `404` y `response.mensaje == 'Usuario no encontrado'`.

## Reto

### 1 — Filtro que no existe

Añade un Scenario que liste productos con `param categoria = 'audio'`.

<details>
<summary>Ver solución</summary>

El mock filtra la lista; no hay categoría `audio`, así que `response == '#[0]'` y status 200 (lista vacía, no 404).

```gherkin
Scenario: Categoria sin productos
  And path 'productos'
  And param categoria = 'audio'
  When method get
  Then status 200
  And match response == '#[0]'
```

</details>

## Errores frecuentes

| Síntoma | Causa probable | Cómo arreglarlo |
|---------|----------------|-----------------|
| `404 Ruta no mockeada` | `path '/productos'` con barra | `path 'productos'` |
| Connection refused | Estás usando un host escrito a mano | Deja `url baseUrl` |
| El filtro devuelve 3 productos | El param no se envió | `And param categoria = 'periferico'` **antes** de `method get` |
