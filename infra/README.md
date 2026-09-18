# Infraestructura de laboratorio

Proyecto **Maven + Java 17 + Karate 1.4.1**. Los tests viven en `src/test/java/features/`. Un mock HTTP de tienda arranca solo al ejecutar Karate (`src/test/java/mock/`).

## Arranque (Codespace)

1. Haz **fork** de este repo a tu cuenta.
2. En **tu fork**: **Code → Codespaces → Create codespace on main**.
3. Espera a que termine el `postCreate` (descarga dependencias Maven).
4. En la terminal:

```bash
java -version
mvn -version
mvn test -Dkarate.options="--tags @smoke"
```

## Comandos útiles

| Qué | Comando |
|-----|---------|
| Humo | `mvn test -Dkarate.options="--tags @smoke"` |
| Un módulo | `mvn test -Dkarate.options="--tags @m03"` |
| Todo | `mvn test` |
| Un feature | `mvn test -Dkarate.options="classpath:features/m03/get.feature"` |

Informe HTML: `target/karate-reports/karate-summary.html` (ábrelo con **Live Preview** en VS Code).

## Puertos

Karate no abre una aplicación de escritorio.

| Qué | Puerto | ¿Lo tienes que abrir en el navegador? |
|-----|--------|----------------------------------------|
| Mock de tienda (`karate.start`) | aleatorio, solo `localhost` dentro del Codespace | No. Los tests ya lo usan. |
| Informe HTML | ningún servidor | No. Es un fichero; Live Preview basta. |
| Mock de pedidos (M07) | aleatorio, igual que la tienda | No, salvo que quieras `curl` desde la terminal. |

Si un proceso llega a escuchar un puerto, Codespaces lo muestra en la pestaña **Ports** y genera una URL `*.app.github.dev`. Para este curso **no es un paso del lab**: trabaja siempre contra `localhost` en la terminal del Codespace.

## Árbol relevante

```text
src/test/java/
  karate-config.js          # baseUrl del mock de tienda
  mock/tienda.feature       # API local (productos, usuarios)
  mock/start.js             # karate.start una vez por ejecución
  mock/pedidos.feature      # mock ad hoc de M07
  features/smoke.feature
  features/m02 … m07/
  runners/KarateTest.java
```

## Local (sin Codespace)

JDK 17 y Maven 3.9+. Luego los mismos `mvn test`. Importar como proyecto Maven en el IDE que uses.
