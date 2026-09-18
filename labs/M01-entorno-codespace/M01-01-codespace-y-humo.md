# M01-01 — Codespace y humo

[← Página anterior](README.md) · [Siguiente página →](../M02-introduccion-karate/README.md)

> Práctica del módulo. La teoría y la demo están en el [README del módulo](README.md).

### Objetivo

Dejar el laboratorio arrancado y pasar el test `@smoke`.

### Prerrequisitos

- Cuenta GitHub.
- Permiso para crear Codespaces (la máquina por defecto, 2 vCPU, basta).

### En qué consiste

Fork, Codespace, comprobación de Java/Maven y ejecución del feature de humo.

### 1 — Fork y Codespace

**Acción:** Haz fork de `my-it-labs/karate-api-101` a tu cuenta. En **tu fork**: **Code → Codespaces → Create codespace on main**.

**Por qué:** Cada persona trabaja en su copia. El Codespace es tu JDK + Maven; no instalas nada en el portátil.

**Resultado esperado:** VS Code en el navegador, terminal en `/workspaces/karate-api-101` (o el nombre de tu fork).

> [!TIP]
> Si el `postCreate` sigue en marcha, espera a que desaparezca el aviso de *Running post-create commands* antes de lanzar Maven.

### 2 — Java y Maven

**Acción:**

```bash
java -version
mvn -version
```

**Por qué:** Karate 1.4.1 en este repo está compilado para **Java 17**. Si vieras 8 u 11, el Codespace no ha montado la imagen del `.devcontainer`.

**Resultado esperado:** `openjdk ... 17` (o un 17.x) y Maven 3.9.x.

### 3 — Test de humo

**Acción:**

```bash
mvn test -Dkarate.options="--tags @smoke"
```

**Por qué:** `@smoke` apunta a `features/smoke.feature`: un GET a `/productos` contra el mock local. Si esto pasa, el resto de módulos tiene API.

**Resultado esperado:** `BUILD SUCCESS` y `failed: 0`. En el log aparece una línea del estilo `mock tienda escuchando en http://localhost:<puerto>`.

### 4 — Informe HTML

**Acción:** En el explorador de ficheros abre `target/karate-reports/karate-summary.html`. Clic derecho → **Show Preview** o el icono de **Live Preview**.

**Por qué:** Karate escribe un informe por ejecución. En clase lo usamos para ver el request/response, no para publicar un servidor.

**Resultado esperado:** una fila verde para `smoke.feature`. Al entrar en el escenario ves status `200` y un JSON con tres productos.

## Comprueba tu entendimiento

**Tags**

`mvn test -Dkarate.options="--tags @no-existe"`

→ BUILD SUCCESS (0 escenarios) o un runner vacío; no debe fallar por el mock.

**Dónde estás**

`pwd` y `ls pom.xml src/test/java/features/smoke.feature`

→ Estás en la raíz del repo y el feature de humo existe.

## Reto

### 1 — Qué inyecta `baseUrl`

Abre `src/test/java/karate-config.js` y `src/test/java/features/smoke.feature`. ¿De dónde sale `baseUrl`?

<details>
<summary>Ver solución</summary>

`karate-config.js` llama a `mock/start.js`, que hace `karate.start` del feature `mock/tienda.feature`. El puerto aleatorio se concatena a `http://localhost:`. El smoke usa `url baseUrl` sin escribir el host a mano.

</details>

## Errores frecuentes

| Síntoma | Causa probable | Cómo arreglarlo |
|---------|----------------|-----------------|
| No aparece *Create codespace* | Estás en el repo original sin fork | Fork primero; Codespace en **tu** copia |
| `mvn: command not found` | El Codespace no usó el devcontainer | *Reopen in Container* / recrea el Codespace |
| Download Maven eterno | Red corporativa | Espera al `postCreate`; no lances un segundo `mvn` a la vez |
| Informe HTML en blanco | Preview de VS Code sobre un path `file://` raro | Live Preview, o `python3 -m http.server -d target/karate-reports 5500` y abre el puerto **solo** si quieres verlo en el navegador del portátil |
