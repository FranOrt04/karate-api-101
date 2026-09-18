# M02-01 — DSL, variables y match

[← Página anterior](README.md) · [Siguiente página →](../M03-peticiones-http/README.md)

> Práctica del módulo. La teoría y la demo están en el [README del módulo](README.md).

### Objetivo

Leer un feature sin HTTP, ejecutarlo por tag y distinguir un `match` de valor de un `match` de tipo.

### Prerrequisitos

- M01-01 hecho (`mvn test -Dkarate.options="--tags @smoke"` en verde).

### En qué consiste

Abres `dsl.feature`, lo lanzas, provocas un fallo a propósito y añades un escenario.

### 1 — Abrir el feature

**Acción:** Abre `src/test/java/features/m02/dsl.feature`.

**Por qué:** Es el único feature etiquetado `@m02`. Todo lo que practicas aquí cabe en variables y `match`.

**Resultado esperado:** ves `Background` con `iva` y dos `Scenario`.

### 2 — Ejecutar solo M02

**Acción:**

```bash
mvn test -Dkarate.options="--tags @m02"
```

**Por qué:** Sin tag, Maven corre todo el curso. En clase interesa un módulo cada vez.

**Resultado esperado:** 2 escenarios, `failed: 0`.

### 3 — Ver un match fallar

**Acción:** En el primer Scenario cambia `match nombre == 'Teclado'` por `match nombre == 'Raton'`. Guarda y vuelve a lanzar el comando del paso 2.

**Por qué:** El informe HTML es útil cuando **falla**. Karate enseña el valor actual y el esperado.

**Resultado esperado:** `BUILD FAILURE`. En el report, el paso `match nombre` en rojo; actual `Teclado`.

**Acción (después):** Devuelve `'Teclado'` y re-ejecuta hasta verde.

### 4 — Marcadores de tipo

**Acción:** En el mismo Scenario, debajo de `match producto.stock == '#number'`, añade:

```gherkin
And match producto.nombre == '#string'
And match etiquetas[0] == '#string'
```

Guarda y lanza `@m02` otra vez.

**Por qué:** `'#string'` y `'#number'` no son literales: son el esquema mínimo. Si `stock` fuera `"10"` (string), este match fallaría.

**Resultado esperado:** sigue verde.

## Comprueba tu entendimiento

**Tag vs classpath**

`mvn test -Dkarate.options="classpath:features/m02/dsl.feature"`

→ Mismo resultado que `--tags @m02` en este repo (solo hay un feature m02).

## Reto

### 1 — Precio con IVA de un producto a 25

Añade un Scenario que use `conIva(25)` y compruebe el resultado.

<details>
<summary>Ver solución</summary>

```gherkin
Scenario: IVA de un teclado
  When def resultado = conIva(25)
  Then match resultado == 30.25
```

`25 * 1.21 = 30.25`. Karate compara números con igualdad JS.

</details>

## Errores frecuentes

| Síntoma | Causa probable | Cómo arreglarlo |
|---------|----------------|-----------------|
| `match` dice que `'#string'` no es igual a `Teclado` | Faltan las comillas del marcador o usaste `=` en vez de `==` | `match x == '#string'` |
| El tag `@m02` no corre nada | Guardaste el feature fuera de `features/` | Deja el fichero en `src/test/java/features/m02/` |
| Siguen corriendo todos los módulos | Olvidaste `-Dkarate.options` | Copia el comando del paso 2 |
