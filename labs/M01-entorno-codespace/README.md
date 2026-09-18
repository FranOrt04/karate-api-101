# M01 — Entorno y proyecto Maven

[← Página anterior](../../README.md) · [Siguiente página →](M01-01-proyecto-maven.md)

> [!NOTE]
> **Cómo funciona este módulo.** Primero la **teoría**, luego la **demostración guiada** del formador, y después **practicas tú** en el laboratorio.

## Qué aprenderás

- Fork y Codespace (JDK 17 + Maven, **sin** proyecto Karate hecho).
- Escribir el `pom.xml` por piezas e instalar `karate-junit5`.
- Escribir el runner JUnit y el primer `.feature` hasta verlo verde.
- Enchufar el mock de tienda con `karate-config.js` y un GET de humo.

## Teoría

El Codespace no es el curso: es el **JDK y Maven**. Karate entra cuando el `pom` declara `karate-junit5` y Maven descarga esa dependencia.

| Pieza | ¿Quién la pone? |
|-------|-----------------|
| `.devcontainer` (Java 17, Maven, extensiones) | El repo |
| `src/test/java/mock/tienda.feature` | El repo (API local) |
| `pom.xml` | **Tú** (M01-01), por partes |
| `runners/KarateTest.java` | **Tú** (M01-01) |
| `features/*.feature` | **Tú**, módulo a módulo |
| `karate-config.js` | **Tú** (M01-02), para tener `baseUrl` |

Karate busca los `.feature` en el classpath de test. Por eso el pom tiene que marcar `src/test/java` como `testResources` (y excluir `*.java`). Si no, `mvn test` no ve los features.

> [!NOTE]
> El mock no es una ventana de navegador. Cuando exista `karate-config.js`, Karate lo levanta en `localhost` y se apaga al terminar.

## Demostración guiada

> Rama [`example`](https://github.com/my-it-labs/karate-api-101/tree/example). El formador no demo en el fork del alumno.

1. En `example` el `pom.xml` ya tiene `karate.version` 1.4.1, `karate-junit5` en scope test, `testResources` sobre `src/test/java` y Surefire pasando `karate.options`.
2. `KarateTest.java` hace `Karate.run("classpath:features")`.
3. `karate-config.js` llama a `mock/start.js` y expone `baseUrl`. `features/smoke.feature` hace GET `/productos`.
4. `mvn test` deja el informe en `target/karate-reports/`. Extra de demo: `src/test/java/examples/`.

## Ahora practica tú

| Lab | Título | Qué harás |
|-----|--------|-----------|
| M01-01 | [Proyecto Maven](M01-01-proyecto-maven.md) | pom por partes, runner, primer feature, `mvn test` |
| M01-02 | [Config y humo](M01-02-config-y-humo.md) | `karate-config.js` + GET al mock |

→ Empieza por **[M01-01 — Proyecto Maven](M01-01-proyecto-maven.md)**.
