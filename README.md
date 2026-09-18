# Automatización de pruebas con Karate

[Siguiente página →](labs/M01-entorno-codespace/README.md)

Formación **100 % práctica**. El `pom.xml`, el runner y el mock de tienda ya vienen montados. **Tú escribes** los `.feature` en `src/test/java/features/` y los ejecutas con Maven.

El camino de aula es **GitHub Codespaces + VS Code** sobre la rama **`main`**. Si tu empresa te obliga a Eclipse, hay una guía en [infra/eclipse.md](infra/eclipse.md).

## Dos ramas

| Rama | Para quién | Qué hay |
|------|------------|---------|
| **`main`** (tu fork, tu Codespace) | Alumno | Proyecto Maven listo; `features/` vacío para que lo llenes |
| **`example`** | Formador | Labs terminados + extra en `src/test/java/examples/` |

No abras un Codespace sobre `example` para trabajar los labs: te comes el temario. Si te atascas, mira la rama [`example`](https://github.com/my-it-labs/karate-api-101/tree/example) en GitHub, no la copies al empezar.

## Cómo funciona el curso

Sigue este README como índice y avanza **página a página** con **← Página anterior · Siguiente página →**.

Cada módulo tiene dos niveles: el **README del módulo** (teoría + demostración del formador en la rama `example`) y uno o varios **laboratorios** donde **creas** los features.

## Antes de empezar

| Requisito | Dónde |
|-----------|--------|
| Codespace (recomendado) | Fork → **Code → Codespaces → Create codespace on main** ([`.devcontainer/`](.devcontainer/devcontainer.json)) |
| Cómo se ejecutan los tests | [infra/README.md](infra/README.md) |
| Eclipse (opcional) | [infra/eclipse.md](infra/eclipse.md) |

No necesitas cuenta en ninguna API pública. El mock HTTP de tienda arranca **dentro** del Codespace cuando lanzas Karate.

## Módulos

| # | Módulo | Índice |
|---|--------|--------|
| M01 | Entorno Codespace | [labs/M01-entorno-codespace/](labs/M01-entorno-codespace/README.md) |
| M02 | Introducción a Karate | [labs/M02-introduccion-karate/](labs/M02-introduccion-karate/README.md) |
| M03 | Peticiones HTTP | [labs/M03-peticiones-http/](labs/M03-peticiones-http/README.md) |
| M04 | Validaciones | [labs/M04-validaciones/](labs/M04-validaciones/README.md) |
| M05 | Reutilización (`call`) | [labs/M05-reutilizacion/](labs/M05-reutilizacion/README.md) |
| M06 | Data-driven | [labs/M06-data-driven/](labs/M06-data-driven/README.md) |
| M07 | Mocks | [labs/M07-mocks/](labs/M07-mocks/README.md) |

## Empieza aquí

→ **[M01 — Entorno Codespace](labs/M01-entorno-codespace/README.md)**
