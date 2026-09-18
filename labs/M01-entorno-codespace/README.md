# M01 — Entorno Codespace

[← Página anterior](../../README.md) · [Siguiente página →](M01-01-codespace-y-humo.md)

> [!NOTE]
> **Cómo funciona este módulo.** Primero la **teoría**, luego la **demostración guiada** del formador, y después **practicas tú** en el laboratorio.

## Qué aprenderás

- Fork del repo y Codespace como máquina de laboratorio.
- Qué trae el proyecto (pom, runner, mock) y qué tienes que escribir tú (`features/`).
- Crear el primer `.feature` de humo y abrir el informe HTML.

## Teoría

Karate es un DSL sobre Gherkin (`Given` / `When` / `Then`) para probar APIs HTTP. En este curso **no usamos una VM ni Eclipse**. El laboratorio es un contenedor en GitHub Codespaces con JDK 17, Maven y las extensiones de VS Code.

| Pieza | ¿Quién la pone? |
|-------|-----------------|
| `pom.xml` + `KarateTest.java` | Ya vienen |
| `mock/tienda.feature` + `karate-config.js` | Ya vienen (`baseUrl`) |
| `src/test/java/features/*.feature` | **Tú**, módulo a módulo |
| `target/karate-reports/` | Karate, después de `mvn test` |

> [!NOTE]
> El mock **no es una app que abras en el navegador**. Karate lo levanta, los tests hablan con `localhost`, y se apaga al terminar.

Eclipse: [infra/eclipse.md](../../infra/eclipse.md). El camino de clase es Codespace sobre **`main`**.

## Demostración guiada

> Recorrido que hace el formador en vivo en la rama [`example`](https://github.com/my-it-labs/karate-api-101/tree/example). Tono descriptivo, sin imperativos.

1. Al abrir el repo en GitHub, la rama de trabajo es `main`. El Codespace del alumno arranca VS Code en esa rama. El formador tiene **otro** Codespace (o checkout) en `example`.
2. En `example`, `src/test/java/features/smoke.feature` ya lista el catálogo: `url baseUrl`, `path 'productos'`, `status 200`, tres elementos.
3. `mvn test -Dkarate.options="--tags @smoke"` deja el informe en `target/karate-reports/karate-summary.html`. Live Preview lo abre dentro de VS Code.
4. En `example` también está `src/test/java/examples/` (cabeceras, predicados, `call` con lista…). Eso no va al fork del alumno.

## Ahora practica tú

| Lab | Título | Qué harás |
|-----|--------|-----------|
| M01-01 | [Codespace y humo](M01-01-codespace-y-humo.md) | Fork en `main`, inspeccionar el pom, **escribir** `smoke.feature` |

→ Empieza por **[M01-01 — Codespace y humo](M01-01-codespace-y-humo.md)**.
