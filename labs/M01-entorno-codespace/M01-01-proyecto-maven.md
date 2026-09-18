# M01-01 — Proyecto Maven

[← Página anterior](README.md) · [Siguiente página →](M01-02-config-y-humo.md)

> Práctica del módulo. La teoría y la demo están en el [README del módulo](README.md).

### Objetivo

Montar un proyecto Maven que ejecute un `.feature` de Karate. Al final de este lab, `mvn test` está verde **con un feature que has escrito tú**.

### Prerrequisitos

- Cuenta GitHub y permiso para Codespaces (2 vCPU basta).

### En qué consiste

Codespace en `main`, `pom.xml` por piezas, runner JUnit, primer feature (sin HTTP).

### 1 — Fork y Codespace en `main`

**Acción:** Fork de `my-it-labs/karate-api-101`. En **tu fork**: **Code → Codespaces → Create codespace on main**.

```bash
java -version
mvn -version
ls pom.xml src/test/java/runners src/test/java/features
```

**Por qué:** Esta rama no trae el curso compilado. Si ves un `pom.xml` enorme y `dsl.feature`, estás en `example`.

**Resultado esperado:** Java 17, Maven 3.9.x. **No** existe `pom.xml`. `mock/` sí existe. `features/` y `runners/` no (o están vacíos).

### 2 — Esqueleto del pom

**Acción:** Crea `pom.xml` en la **raíz** del repo, solo con coordenadas:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>
    <groupId>com.myitlabs</groupId>
    <artifactId>karate-api-101</artifactId>
    <version>1.0.0</version>
    <packaging>jar</packaging>
</project>
```

```bash
mvn -q validate
```

**Por qué:** Maven ya reconoce el proyecto. Todavía **no** hay Karate.

**Resultado esperado:** `validate` sin error. `mvn test` no corre escenarios de Karate (aún no hay dependencias ni tests).

### 3 — Propiedades y dependencia Karate

**Acción:** Dentro de `<project>`, **antes** de `</project>`, añade:

1. `<properties>` con `project.build.sourceEncoding` = `UTF-8`, `java.version` y `maven.compiler.release` = `17`, `karate.version` = `1.4.1`.
2. `<dependencies>` con **una** dependencia: `com.intuit.karate` / `karate-junit5` / `${karate.version}` / scope **`test`**.

```bash
mvn -q dependency:resolve
```

**Por qué:** Aquí Maven **descarga** Karate. Scope `test` porque no hay código de producción. La versión 1.4.1 es la del curso (no subas a 1.5 sin cambiar el `groupId`).

**Resultado esperado:** en el log aparece `karate-junit5-1.4.1`. En `~/.m2/repository/com/intuit/karate/` hay jars.

### 4 — testResources, compiler y Surefire

**Acción:** Añade un `<build>` con tres cosas:

1. `<testResources>`: directory `src/test/java`, exclude `**/*.java`. **Sin esto Karate no ve los `.feature`.**
2. Plugin `maven-compiler-plugin` 3.13.0, `<release>` 17, encoding UTF-8.
3. Plugin `maven-surefire-plugin` 3.2.5, y en `systemPropertyVariables` la clave `karate.options` = `${karate.options}` (así luego `--tags` llega a Karate).

```bash
mvn -q test-compile
```

**Por qué:** Compilas el árbol de test (todavía vacío) y dejas Surefire listo para el runner.

**Resultado esperado:** `BUILD SUCCESS`. Si `testResources` está mal, el siguiente `mvn test` dirá que no hay features.

### 5 — Runner

**Acción:** Crea `src/test/java/runners/KarateTest.java`:

- `package runners;`
- import `com.intuit.karate.junit5.Karate`
- una clase `KarateTest` (sin `public` vale)
- un método anotado `@Karate.Test` que `return Karate.run("classpath:features");`

**Por qué:** Surefire necesita una clase JUnit. Ese `run` es el único Java que escribes en el curso.

**Resultado esperado:** el fichero existe. `mvn test` **falla** con `no features or scenarios found: [classpath:features]` — es lo correcto: aún no hay `.feature`.

### 6 — Primer feature

**Acción:** Crea `src/test/java/features/hola.feature` con tag `@m01`. Un Scenario sin HTTP: una variable string y un `match` de igualdad (por ejemplo `mensaje == 'hola'`).

```bash
mvn test
```

**Por qué:** El ciclo del resto del curso es este: escribes Gherkin → Maven → informe.

**Resultado esperado:** `BUILD SUCCESS`, `failed: 0`, 1 escenario. Informe en `target/karate-reports/karate-summary.html` (Live Preview).

## Comprueba tu entendimiento

**Tags**

`mvn test -Dkarate.options="--tags @m01"` → el hola. `--tags @no-existe` → 0 escenarios (no debe romper el pom).

**Classpath**

`mvn test -Dkarate.options="classpath:features/hola.feature"` → el mismo escenario.

## Reto

### 1 — Un segundo match de tipo

En el mismo Scenario, `match mensaje == '#string'`. Relanza `mvn test`.

<details>
<summary>Ver solución</summary>

`'#string'` es marcador de tipo, no el texto de la palabra. Si el pom o el runner se atascan, rama `example`: `pom.xml` y `src/test/java/runners/KarateTest.java`. No copies los features de `example` enteros: el hola es tuyo.

</details>

## Errores frecuentes

| Síntoma | Causa probable | Cómo arreglarlo |
|---------|----------------|-----------------|
| Ya hay `pom.xml` y labs hechos | Codespace en `example` | Recrea en **`main`** |
| `no features found` con el hola creado | Falta `testResources` o el feature no está bajo `features/` | Paso 4; path `src/test/java/features/hola.feature` |
| `mvn test` 0 tests y no aparece Karate | Falta el runner o Surefire no lo ve | `package runners;` y ruta `src/test/java/runners/KarateTest.java` |
| Karate 1.5 / otro `groupId` | Copiaste internet | `com.intuit.karate` 1.4.1 |
| `release version 17 not supported` | El JDK del Codespace no es 17 | Recrea el Codespace; `java -version` |
