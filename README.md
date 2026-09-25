# Automatización de pruebas con Karate

[Siguiente página →](labs/M01-entorno-codespace/README.md)

Vas a automatizar pruebas HTTP con Karate: escribirás features en Gherkin, los ejecutarás con Maven y validarás respuestas JSON.

En el Codespace encontrarás **JDK 17 y Maven**. El primer paso será declarar Karate en el `pom.xml` e instalar la dependencia, para ver **dónde vive** y **cómo se pone en marcha**. Después escribirás el runner, tu primer `.feature` y, ya en marcha, el resto de escenarios.

Trabaja en **tu fork**, rama **`main`**. Crea el Codespace desde ahí (**Code → Codespaces → Create codespace on main**).

Eclipse no hace falta; si tu equipo lo pide: [infra/eclipse.md](infra/eclipse.md).

## Cómo avanzar

Sigue este README como índice y pasa **página a página** con **← Página anterior · Siguiente página →**.

En cada módulo lees el README (qué vas a usar y cómo encaja) y luego entras al laboratorio, donde **lo montas tú**.

## Antes de empezar

| Qué | Dónde |
|-----|--------|
| Codespace | Fork → **Code → Codespaces → Create codespace on main** ([`.devcontainer/`](.devcontainer/devcontainer.json)) |
| Comandos Maven | [infra/README.md](infra/README.md) |
| Run del editor (Plus) | [infra/extension-karate.md](infra/extension-karate.md) |
| Eclipse (si te lo piden) | [infra/eclipse.md](infra/eclipse.md) |

En `src/test/java/mock/` tienes una API de tienda local. La enchufarás cuando escribas `karate-config.js` (M01-02). No necesitas APIs públicas.

Si en un lab te quedas pillado, la rama [`example`](https://github.com/my-it-labs/karate-api-101/tree/example) tiene el mismo proyecto ya montado para contrastar. Tú construyes el tuyo en `main`.

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

Cuando cierres M07, si queda tiempo: **[Extensión del temario](labs/extension/README.md)** y, al final, los **[casos de negocio](labs/extension/casos/README.md)**. No forman parte del recorrido de los módulos.

## Empieza aquí

→ **[M01 — Entorno y proyecto Maven](labs/M01-entorno-codespace/README.md)**
