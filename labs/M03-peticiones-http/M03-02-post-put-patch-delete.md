# M03-02 — POST PUT PATCH DELETE

[← Página anterior](M03-01-get-path-params.md) · [Siguiente página →](../M04-validaciones/README.md)

> Práctica del módulo. La teoría y la demo están en el [README del módulo](README.md).

### Objetivo

Enviar un cuerpo JSON y cubrir los cuatro verbos de escritura.

### Prerrequisitos

- M03-01 hecho.

### En qué consiste

Ejecutas `write.feature` y observas que el mock **no persiste** (el POST no crea un GET posterior).

### 1 — Correr los writes

**Acción:**

```bash
mvn test -Dkarate.options="--tags @http-write"
```

**Por qué:** Cuatro escenarios: POST 201, PUT 200, PATCH stock, DELETE 204.

**Resultado esperado:** `failed: 0`.

### 2 — Ver el cuerpo del POST

**Acción:** En el informe, abre *Crear un producto* y mira el request body y el response `id: 99`.

**Por qué:** El mock siempre asigna id 99. No es una base de datos.

**Resultado esperado:** el response copia `nombre` y `precio` del request.

### 3 — Comprobar que no persiste

**Acción:** No añadas todavía código. Lanza:

```bash
mvn test -Dkarate.options="--tags @http-get"
```

y mira que `/productos` sigue teniendo **3** elementos.

**Por qué:** Un error típico de este curso es esperar que el POST del mock se vea en el GET. El catálogo del mock se reinicia en cada petición (lista fija en el `Background` del mock).

**Resultado esperado:** el listado sigue siendo Teclado, Monitor, Webcam.

## Comprueba tu entendimiento

**Header**

En el POST, quita la línea `And header Content-Type = 'application/json'` del Background y lanza `@http-write`.

→ En este mock suele seguir funcionando porque Karate envía JSON igual. Vuelve a dejar el header: es el hábito correcto contra APIs reales.

## Reto

### 1 — POST sin precio

Añade un Scenario que haga POST `{ nombre: 'Cable', categoria: 'periferico', stock: 20 }` **sin** `precio`, y decide qué asertas.

<details>
<summary>Ver solución</summary>

El mock copia `body.precio` (quedará `null`). Un match razonable:

```gherkin
Scenario: POST sin precio
  And path 'productos'
  And request { nombre: 'Cable', categoria: 'periferico', stock: 20 }
  When method post
  Then status 201
  And match response.nombre == 'Cable'
  And match response.precio == '#null'
```

</details>

## Errores frecuentes

| Síntoma | Causa probable | Cómo arreglarlo |
|---------|----------------|-----------------|
| `pathMatches POST` no entra | Olvidaste `method post` / usaste GET | `When method post` |
| Esperabas 4 productos tras el POST | El mock no guarda estado | Asera el **response del POST**, no un GET posterior |
| DELETE falla con 200 | Aserción `status 200` | Este mock responde **204** |
