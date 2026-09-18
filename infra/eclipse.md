# Eclipse (opcional)

El curso se imparte en **Codespaces + VS Code**. Esta página es solo si tu equipo te pide Eclipse.

Haz **primero** el M01-01 en cualquier editor (crear `pom.xml` y el runner). Después importa.

## Qué necesitas

- Eclipse IDE for Java Developers (2023-12 o posterior)
- JDK **17**
- Maven 3.9+ o el embebido de Eclipse

## Importar el proyecto

1. Con el `pom.xml` **ya escrito** (M01-01): **File → Import → Maven → Existing Maven Projects**.
2. Root Directory: la carpeta del repo.
3. Finish. Maven Update (Force Update) si `karate-junit5` sigue en rojo.

**Resultado esperado:** compiler compliance **17**.

## Ejecutar tests

1. Abre `src/test/java/runners/KarateTest.java` (lo escribes en M01-01).
2. Clic derecho → **Run As → JUnit Test**.

## Tags

**Run Configurations → JUnit → Arguments → VM arguments:**

```text
-Dkarate.options=--tags @smoke
```

## Si algo falla

| Síntoma | Qué mirar |
|---------|-----------|
| No hay proyecto Maven | Aún no existe `pom.xml` — M01-01 |
| Compiler 1.8 / 11 | Java Compiler → 17; en el pom, `maven.compiler.release` 17 |
| Features no se ejecutan | `testResources` apuntando a `src/test/java` (sin `*.java`) — lo añades en M01-01 |
