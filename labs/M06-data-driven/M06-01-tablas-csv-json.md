# M06-01 — Tablas, CSV y JSON

[← Página anterior](README.md) · [Siguiente página →](../M07-mocks/README.md)

> El concepto está en el [README del módulo](README.md). Aquí lo montas tú.

### Objetivo

Vas a repetir el mismo GET con tres fuentes: tabla, CSV y JSON.

### Prerrequisitos

- M05 hecho.

### En qué consiste

Vas a crear `features/m06/` con dos features y dos ficheros de datos.

### 1 — Tabla embebida

**Acción:** `tabla.feature` tags `@m06 @ddt-tabla`. Outline GET `productos/<id>` 200, `nombre` y `categoria`. Filas: 1 Teclado periferico, 2 Monitor pantalla, 3 Webcam periferico.

**Resultado esperado:** `mvn test -Dkarate.options="--tags @ddt-tabla"` → 3 filas verdes.

### 2 — CSV y JSON

**Acción:** Crea `productos.csv` (`id,nombre,precio` con los tres productos). Crea `casos.json` (array de `{ id, nombre }` al menos para 1 y 2). `ficheros.feature` tags `@m06 @ddt-ficheros` con dos Outlines: uno `read('productos.csv')` comprobando precio; otro `read('casos.json')` comprobando nombre.

**Resultado esperado:** `@ddt-ficheros` → 3 + 2 verdes.

### 3 — Romper una fila

**Acción:** En el CSV pon precio del Monitor a `1`, relanza, mira **solo** esa fila roja, restaura `180`.

**Resultado esperado:** el resto de filas siguen verdes.

## Comprueba tu entendimiento

`match response.precio == '<precio>'` (con comillas) compara string `"25"` con número `25` y falla.

## Reto

### 1 — Fila id 4

Añádela al CSV. Debe fallar (el mock solo tiene 1–3). Quítala.

<details>
<summary>Ver solución</summary>

El Outline espera 200; id 4 es 404. Para mezclar status haría falta una columna `status`.

Si quieres contrastar, en `example` está `features/m06/`.

</details>

## Errores frecuentes

| Síntoma | Causa probable | Cómo arreglarlo |
|---------|----------------|-----------------|
| `read` no encuentra el CSV | Otra carpeta | Junto a `ficheros.feature` |
| Todas las filas fallan | Cabecera ≠ placeholders | `id,nombre,precio` |
| JSON no expande | No es un array | `[ {...}, {...} ]` |
