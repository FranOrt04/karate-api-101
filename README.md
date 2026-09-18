# Automatización de pruebas con Karate

[Siguiente página →](labs/M01-entorno-codespace/README.md)

Formación **100 % práctica**. El Codespace trae **JDK 17 y Maven**. Tú montas el proyecto: `pom.xml` por partes, el runner JUnit y los `.feature`.

El camino de aula es **GitHub Codespaces + VS Code** sobre la rama **`main`**. Eclipse: [infra/eclipse.md](infra/eclipse.md).

## Dos ramas

| Rama | Para quién | Qué hay |
|------|------------|---------|
| **`main`** (tu fork, tu Codespace) | Alumno | Devcontainer + mock de tienda + labs. **Sin** pom ni runner ni features |
| **`example`** | Formador | Proyecto completo + extra en `src/test/java/examples/` |

No abras un Codespace sobre `example` para hacer los labs. Si te atascas, mira [`example`](https://github.com/my-it-labs/karate-api-101/tree/example) en GitHub.

## Cómo funciona el curso

Sigue este README como índice y avanza **página a página** con **← Página anterior · Siguiente página →**.

Cada módulo: **README** (teoría + demo del formador en `example`) y **labs** donde construyes tú.

## Antes de empezar

| Requisito | Dónde |
|-----------|--------|
| Codespace | Fork → **Code → Codespaces → Create codespace on main** ([`.devcontainer/`](.devcontainer/devcontainer.json)) |
| Cómo se ejecuta Maven | [infra/README.md](infra/README.md) |
| Eclipse (opcional) | [infra/eclipse.md](infra/eclipse.md) |

El mock HTTP de tienda (`src/test/java/mock/`) está en el repo; lo enchufas en M01-02 cuando escribas `karate-config.js`.

## Módulos

| # | Módulo | Índice |
|---|--------|--------|
| M01 | Entorno y proyecto Maven | [labs/M01-entorno-codespace/](labs/M01-entorno-codespace/README.md) |
| M02 | Introducción a Karate | [labs/M02-introduccion-karate/](labs/M02-introduccion-karate/README.md) |
| M03 | Peticiones HTTP | [labs/M03-peticiones-http/](labs/M03-peticiones-http/README.md) |
| M04 | Validaciones | [labs/M04-validaciones/](labs/M04-validaciones/README.md) |
| M05 | Reutilización (`call`) | [labs/M05-reutilizacion/](labs/M05-reutilizacion/README.md) |
| M06 | Data-driven | [labs/M06-data-driven/](labs/M06-data-driven/README.md) |
| M07 | Mocks | [labs/M07-mocks/](labs/M07-mocks/README.md) |

## Empieza aquí

→ **[M01 — Entorno y proyecto Maven](labs/M01-entorno-codespace/README.md)**
