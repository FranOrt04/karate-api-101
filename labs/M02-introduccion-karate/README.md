# M02 — Introducción a Karate

[← Página anterior](../M01-entorno-codespace/M01-01-codespace-y-humo.md) · [Siguiente página →](M02-01-dsl-variables-match.md)

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

> Recorrido que hace el formador en vivo. Tono descriptivo, sin imperativos.

1. Al abrir `src/test/java/features/m02/dsl.feature` se ve un `Background` con `iva` y una función `conIva`.
2. El primer Scenario declara un string, un número, un array y un objeto. Cada `match` comprueba valor o tipo.
3. El segundo Scenario llama a `conIva(100)` y espera `121`.
4. `mvn test -Dkarate.options="--tags @m02"` corre solo este feature. El informe muestra dos escenarios en verde.

## Ahora practica tú

| Lab | Título | Qué harás |
|-----|--------|-----------|
| M02-01 | [DSL, variables y match](M02-01-dsl-variables-match.md) | Ejecutar el feature, romper un match y ampliarlo |

→ Empieza por **[M02-01 — DSL, variables y match](M02-01-dsl-variables-match.md)**.
