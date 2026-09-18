# Infraestructura de laboratorio

El Codespace instala **JDK 17** y **Maven 3.9**. El `pom.xml`, el runner y los features **los escribes tú** (M01). El mock de tienda sí viene: `src/test/java/mock/`.

## Arranque (Codespace)

1. Fork de este repo.
2. En **tu fork**: **Code → Codespaces → Create codespace on `main`**.
3. El `postCreate` solo comprueba `java` y `mvn`. **No** descarga Karate todavía.

```bash
java -version
mvn -version
ls pom.xml   # no debería existir aún
```

Karate entra cuando completes el `pom.xml` del M01-01 (`mvn test-compile` o el primer `mvn test`).

## Comandos útiles (cuando ya tengas pom y runner)

| Qué | Comando |
|-----|---------|
| Primer feature | `mvn test` |
| Humo | `mvn test -Dkarate.options="--tags @smoke"` |
| Un módulo | `mvn test -Dkarate.options="--tags @m03"` |
| Un feature | `mvn test -Dkarate.options="classpath:features/m03/get.feature"` |

Informe HTML: `target/karate-reports/karate-summary.html`.

## Ramas

| Rama | Uso |
|------|-----|
| `main` | Tu trabajo |
| [`example`](https://github.com/my-it-labs/karate-api-101/tree/example) | Demos (`pom.xml` cerrado, features y `examples/`) |

## Puertos

Karate no abre una app de escritorio. El mock de tienda usa un puerto aleatorio en `localhost` **dentro** del Codespace. No es un paso abrir **Ports**.

## Árbol al clonar `main`

```text
.devcontainer/           # JDK 17 + Maven
labs/                    # guiones
src/test/java/mock/      # API de tienda (la enchufas en M01-02)
# pom.xml, runner, karate-config.js, features/ → los creas tú
```

## Local (sin Codespace)

JDK 17 y Maven 3.9+. Luego el mismo M01 (crear pom, etc.).
