# Eclipse (opcional)

El curso se imparte en **Codespaces + VS Code**. Esta página es solo si tu equipo te pide Eclipse.

## Qué necesitas

- Eclipse IDE for Java Developers (2023-12 o posterior)
- JDK **17**
- Maven embebido o un Maven 3.9+ en el PATH

## Importar el proyecto

1. **File → Import → Maven → Existing Maven Projects**.
2. Root Directory: la carpeta del repo (donde está `pom.xml`).
3. Finish. Espera a que Maven descargue `karate-junit5`.

**Resultado esperado:** el proyecto `karate-api-101` aparece sin errores de build. `Java Compiler` en 17.

## Ejecutar tests

1. Abre `src/test/java/runners/KarateTest.java`.
2. Clic derecho → **Run As → JUnit Test**.

Equivale a `mvn test`. El informe queda en `target/karate-reports/karate-summary.html`. Ábrelo con un navegador del sistema.

## Tags

En **Run Configurations → JUnit → Arguments → VM arguments**:

```text
-Dkarate.options=--tags @smoke
```

## Gherkin en el editor

Marketplace de Eclipse: plugin **Cucumber Eclipse** o **Natural**. No es obligatorio para ejecutar; solo colorea los `.feature`.

## Si algo falla

| Síntoma | Qué mirar |
|---------|-----------|
| Compiler compliance 1.8 / 11 | Project → Properties → Java Compiler → 17 |
| `karate-junit5` en rojo | Maven → Update Project (Force Update) |
| Tests no descubren features | `pom.xml` debe marcar `src/test/java` como `testResources` (ya viene así) |
