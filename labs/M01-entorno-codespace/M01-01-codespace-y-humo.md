# M01-01 — Codespace y humo

[← Página anterior](README.md) · [Siguiente página →](../M02-introduccion-karate/README.md)

> Práctica del módulo. La teoría y la demo están en el [README del módulo](README.md).

### Objetivo

Dejar el Codespace en `main` y **escribir** el primer feature de humo contra la tienda.

### Prerrequisitos

- Cuenta GitHub y permiso para crear Codespaces (2 vCPU basta).

### En qué consiste

Fork, Codespace, lectura del pom/runner/mock y creación de `features/smoke.feature`.

### 1 — Fork y Codespace en `main`

**Acción:** Haz fork de `my-it-labs/karate-api-101`. En **tu fork**: **Code → Codespaces → Create codespace on main**.

**Por qué:** `main` es la rama de trabajo. `example` es del formador; si arrancas ahí, los labs ya están hechos.

**Resultado esperado:** terminal en `/workspaces/karate-api-101` (o el nombre de tu fork). `git branch` muestra `main`.

> [!TIP]
> Espera a que termine *Running post-create commands* (Maven descarga `karate-junit5`).

### 2 — Java, Maven y el árbol que ya viene

**Acción:**

```bash
java -version
mvn -version
ls pom.xml src/test/java/runners/KarateTest.java src/test/java/mock/tienda.feature src/test/java/features
```

**Por qué:** El curso no te pide crear el pom ni el runner. Sí te pide verlos: Java 17, `karate-junit5`, mock de tienda, carpeta `features/` casi vacía.

**Resultado esperado:** `openjdk ... 17`, Maven 3.9.x, y en `features/` un README más `_entorno.feature`. **No** están `dsl.feature` ni el resto de labs.

### 3 — Escribe el humo

**Acción:** Crea `src/test/java/features/smoke.feature` con tag `@smoke`. Un solo Scenario: GET a `productos` (usa `url baseUrl`), espera `200` y que la lista tenga 3 elementos. El primero se llama `Teclado`.

**Por qué:** `baseUrl` lo inyecta `karate-config.js`. Si este GET pasa, el mock está vivo y puedes seguir el curso.

**Resultado esperado:** al guardar, el fichero queda bajo `features/`, no bajo `mock/`.

### 4 — Ejecutar e informe

**Acción:**

```bash
mvn test -Dkarate.options="--tags @smoke"
```

Abre `target/karate-reports/karate-summary.html` con Live Preview.

**Por qué:** A partir de aquí cada lab es el mismo ciclo: escribes → `mvn test` → lees el informe.

**Resultado esperado:** `BUILD SUCCESS`, `failed: 0`. En el log, `mock tienda escuchando en http://localhost:<puerto>`. El HTML muestra el JSON de tres productos.

## Comprueba tu entendimiento

**Qué no tienes que crear**

Abre `pom.xml` y localiza `karate-junit5`. Abre `KarateTest.java`.

→ El runner hace `Karate.run("classpath:features")`. Todo lo que pongas en esa carpeta entra al suite.

**Tag inexistente**

`mvn test -Dkarate.options="--tags @no-existe"`

→ 0 escenarios, sin fallo del mock.

## Reto

### 1 — De dónde sale `baseUrl`

Lee `karate-config.js` y `mock/start.js`. ¿Qué pasaría si en el smoke escribieras `url 'http://localhost:8080'`?

<details>
<summary>Ver solución</summary>

El puerto del mock es **aleatorio**. `karate-config.js` concatena `http://localhost:` + ese puerto. Un 8080 fijo suele dar *connection refused*.

Si te atasca el Gherkin del smoke, míralo en la rama `example`: `src/test/java/features/smoke.feature`.

</details>

## Errores frecuentes

| Síntoma | Causa probable | Cómo arreglarlo |
|---------|----------------|-----------------|
| Los labs ya están escritos | Codespace sobre `example` | Recrea el Codespace en **`main`** |
| `mvn test` 0 escenarios | Aún no hay `.feature` o el tag no coincide | Paso 3; tag `@smoke` |
| `404 Ruta no mockeada` | `path '/productos'` con barra | `path 'productos'` |
| Connection refused | Host/puerto a mano | `url baseUrl` |
