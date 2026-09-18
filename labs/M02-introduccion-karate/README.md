# M02 — Introducción a Karate

[← Página anterior](../M01-entorno-codespace/M01-02-config-y-humo.md) · [Siguiente página →](M02-01-dsl-variables-match.md)

> [!NOTE]
> **Cómo funciona este módulo.** Primero la **teoría**, luego la **demostración guiada** del formador, y después **practicas tú** en el laboratorio.

## Qué aprenderás

- Anatomía de un `.feature`: `Feature`, `Background`, `Scenario`.
- Variables (`def`), JSON embebido y `match`.
- Cómo limitar la ejecución con tags.

## Teoría

Karate reutiliza Gherkin, pero **no es Cucumber clásico**: las steps no las implementas en Java. El propio motor interpreta `def`, `match`, `url`, `method`.

| Concepto | Qué es | Qué no es |
|----------|--------|-----------|
| `Feature` | Fichero de escenarios | Una clase Java de producción |
| `Background` | Se ejecuta antes de cada Scenario | Un `BeforeAll` global del suite |
| `def` | Asigna una variable | Un tipo estático |
| `match` | Aserción (igualdad, tipos, `contains`) | Un `print` de depuración |
| tag `@m02` | Filtro de ejecución | Documentación opcional |

`match x == '#string'` no compara el texto `"#string"`: es un **marcador de tipo**. `'#[2]'` significa «array de dos elementos».

En este módulo **no hay HTTP**. Sirve para coger el DSL antes de mezclarlo con `method get`.

## Demostración guiada

> Recorrido en la rama [`example`](https://github.com/my-it-labs/karate-api-101/tree/example).

1. En `src/test/java/features/m02/dsl.feature` hay un `Background` con `iva` y `conIva`, un Scenario de variables/`match` y otro que llama a la función.
2. `mvn test -Dkarate.options="--tags @m02"` deja dos escenarios verdes.
3. Si el grupo pide más DSL: `src/test/java/examples/m02-expresiones.feature` (`#regex`, `assert`, función en bloque).

## Ahora practica tú

| Lab | Título | Qué harás |
|-----|--------|-----------|
| M02-01 | [DSL, variables y match](M02-01-dsl-variables-match.md) | **Crear** `dsl.feature` desde cero |

→ Empieza por **[M02-01 — DSL, variables y match](M02-01-dsl-variables-match.md)**.
