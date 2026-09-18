# M02-01 — DSL, variables y match

[← Página anterior](README.md) · [Siguiente página →](../M03-peticiones-http/README.md)

> Práctica del módulo. La teoría y la demo están en el [README del módulo](README.md).

### Objetivo

Crear un feature sin HTTP, ejecutarlo por tag y distinguir un `match` de valor de un `match` de tipo.

### Prerrequisitos

- M01-01 hecho (`@smoke` en verde).

### En qué consiste

Creas `features/m02/dsl.feature`, lo lanzas, provocas un fallo a propósito y añades un escenario.

### 1 — Crear el fichero

**Acción:** Crea la carpeta `src/test/java/features/m02/` y el fichero `dsl.feature`. Primera línea: tag `@m02`. `Feature` con el título que quieras. Un `Background` que defina `iva = 0.21` y una función `conIva` que multiplique el precio por `(1 + iva)`.

**Por qué:** El Background se reutiliza en todos los Scenario del fichero. La función la usarás en el reto.

**Resultado esperado:** el fichero existe y todavía **no** tiene Scenario (o tiene uno a medias). `mvn test -Dkarate.options="--tags @m02"` puede decir 0 escenarios.

### 2 — Scenario de variables

**Acción:** Añade un Scenario que declare:

- un string `nombre` (`Teclado`)
- un número `precio` (`25`)
- un array `etiquetas` de dos strings
- un objeto `producto` con `nombre`, `precio` y `stock`

Haz `match` de igualdad sobre `nombre` y `precio`, de tipo sobre el array (`#array`, `#[2]`), el objeto (`#object`) y `stock` (`#number`).

**Por qué:** Es el vocabulario que luego aplicarás al JSON de la API.

**Resultado esperado:**

```bash
mvn test -Dkarate.options="--tags @m02"
```

`failed: 0` con 1 escenario.

### 3 — Ver un match fallar

**Acción:** Cambia el match de `nombre` a `'Raton'`, lanza `@m02`, mira el informe en rojo, y restaura `'Teclado'`.

**Por qué:** El informe enseña actual vs esperado. En clase interesa verlo **antes** de los GET.

**Resultado esperado:** `BUILD FAILURE` y después otra vez verde.

### 4 — Marcadores de tipo de más

**Acción:** En el mismo Scenario añade `match producto.nombre == '#string'` y `match etiquetas[0] == '#string'`. Relanza.

**Por qué:** `'#string'` no es el literal de la palabra string.

**Resultado esperado:** sigue verde.

## Comprueba tu entendimiento

**Classpath**

`mvn test -Dkarate.options="classpath:features/m02/dsl.feature"`

→ Equivale a `--tags @m02` mientras solo tengas este feature en m02.

## Reto

### 1 — Función `conIva(25)`

Añade un segundo Scenario que llame a `conIva(25)` y compruebe el resultado.

<details>
<summary>Ver solución</summary>

`25 * 1.21 = 30.25`.

```gherkin
Scenario: IVA de un teclado
  When def resultado = conIva(25)
  Then match resultado == 30.25
```

Si quieres ver una versión ya montada (con `conIva(100) == 121`), rama `example` → `src/test/java/features/m02/dsl.feature`. Extra de regex/assert: `src/test/java/examples/m02-expresiones.feature`.

</details>

## Errores frecuentes

| Síntoma | Causa probable | Cómo arreglarlo |
|---------|----------------|-----------------|
| El fichero ya existía completo | Estás en `example` | Vuelve a `main` |
| `match` trata `'#string'` como texto vs `Teclado` | Faltan comillas del marcador o usaste `=` | `match x == '#string'` |
| `@m02` no corre nada | El feature no está bajo `features/` | `src/test/java/features/m02/dsl.feature` |
