# M01 — Entorno Codespace

[← Página anterior](../../README.md) · [Siguiente página →](M01-01-codespace-y-humo.md)

> [!NOTE]
> **Cómo funciona este módulo.** Primero la **teoría**, luego la **demostración guiada** del formador, y después **practicas tú** en el laboratorio.

## Qué aprenderás

- Fork del repo y Codespace como máquina de laboratorio.
- Dónde viven los `.feature`, el `pom.xml` y el mock.
- Cómo lanzar un test de humo y abrir el informe HTML.

## Teoría

Karate es un DSL sobre Gherkin (`Given` / `When` / `Then`) para probar APIs HTTP. En este curso **no usamos una VM ni Eclipse**. El laboratorio es un contenedor en GitHub Codespaces con JDK 17, Maven y las extensiones de VS Code.

| Pieza | Rol |
|-------|-----|
| `pom.xml` | Dependencia `karate-junit5` 1.4.1 |
| `src/test/java/features/` | Tus escenarios |
| `src/test/java/mock/` | API de tienda local (`karate.start`) |
| `karate-config.js` | Inyecta `baseUrl` hacia ese mock |
| `target/karate-reports/` | Informe HTML después de `mvn test` |

> [!NOTE]
> El mock **no es una app que abras en el navegador**. Karate lo levanta, los tests hablan con `localhost`, y se apaga al terminar. La pestaña Ports de Codespaces puede mostrar un puerto: ignóralo salvo que quieras hacer `curl` a mano.

Eclipse queda documentado en [infra/eclipse.md](../../infra/eclipse.md) por si tu empresa lo exige. El camino de clase es Codespace.

## Demostración guiada

> Recorrido que hace el formador en vivo. Tono descriptivo, sin imperativos.

1. Al abrir el repo en GitHub aparece **Code → Codespaces**. El Codespace arranca VS Code en el navegador, en la raíz del proyecto.
2. En la terminal, `java -version` muestra 17 y `mvn -version` responde. El `postCreate` ya descargó las dependencias.
3. Un `mvn test -Dkarate.options="--tags @smoke"` ejecuta un único escenario GET contra el catálogo. En la salida aparece `Karate version` y `failed: 0`.
4. En `target/karate-reports/karate-summary.html` el informe lista el feature de humo en verde. Live Preview lo abre dentro de VS Code: no hace falta publicar un puerto.

## Ahora practica tú

| Lab | Título | Qué harás |
|-----|--------|-----------|
| M01-01 | [Codespace y humo](M01-01-codespace-y-humo.md) | Fork, Codespace, primer `mvn test` e informe |

→ Empieza por **[M01-01 — Codespace y humo](M01-01-codespace-y-humo.md)**.
