# Infraestructura de laboratorio

Proyecto **Maven + Java 17 + Karate 1.4.1**. El pom, el runner y el mock de tienda **ya están**. Los tests los escribes tú en `src/test/java/features/`.

## Arranque (Codespace)

1. Haz **fork** de este repo a tu cuenta.
2. En **tu fork**: **Code → Codespaces → Create codespace on `main`**.
3. Espera a que termine el `postCreate` (descarga `karate-junit5`).
4. En la terminal:

```bash
java -version
mvn -version
```

Hasta que no escribas `smoke.feature`, `mvn test` solo pasa el escenario `@entorno` (arranca Karate). El humo lo escribes en M01.

## Comandos útiles

| Qué | Comando |
|-----|---------|
| Humo (cuando exista) | `mvn test -Dkarate.options="--tags @smoke"` |
| Un módulo | `mvn test -Dkarate.options="--tags @m03"` |
| Todo lo que hayas escrito | `mvn test` |
| Un feature | `mvn test -Dkarate.options="classpath:features/m03/get.feature"` |

Informe HTML: `target/karate-reports/karate-summary.html` (Live Preview en VS Code).

## Ramas

| Rama | Uso |
|------|-----|
| `main` | Tu trabajo |
| [`example`](https://github.com/my-it-labs/karate-api-101/tree/example) | Demos del formador (`features/` terminados + `examples/`) |

## Puertos

Karate no abre una aplicación de escritorio.

| Qué | Puerto | ¿Lo abres en el navegador? |
|-----|--------|----------------------------|
| Mock de tienda (`karate.start`) | aleatorio, `localhost` dentro del Codespace | No. Los tests ya lo usan. |
| Informe HTML | ningún servidor | No. Es un fichero. |
| Mock de pedidos (M07, lo escribes tú) | aleatorio | No, salvo `curl` de curiosidad. |

Si Codespaces lista un puerto en **Ports**, ignóralo como paso de lab.

## Árbol que ya viene

```text
pom.xml
src/test/java/
  karate-config.js       # inyecta baseUrl
  mock/tienda.feature    # API local (productos, usuarios)
  mock/start.js
  runners/KarateTest.java
  features/              # aquí trabajas tú
```

## Local (sin Codespace)

JDK 17 y Maven 3.9+. Los mismos `mvn test`. Importar como proyecto Maven en el IDE que uses.
