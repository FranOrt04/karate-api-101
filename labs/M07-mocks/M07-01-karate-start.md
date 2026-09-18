# M07-01 — karate.start

[← Página anterior](README.md) · [Siguiente página →](../../README.md)

> Práctica del módulo. La teoría y la demo están en el [README del módulo](README.md).

### Objetivo

Levantar un mock propio y probarlo sin la API de tienda.

### Prerrequisitos

- El resto de módulos en verde (`mvn test`).

### En qué consiste

Ejecutas `@m07`, miras `pathMatches` y añades un POST de pedido.

### 1 — Correr pedidos

**Acción:**

```bash
mvn test -Dkarate.options="--tags @m07"
```

**Por qué:** Un solo Scenario de cliente contra un mock que **tú** controlas.

**Resultado esperado:** 200, `estado == 'enviado'`, `id == '77'`.

### 2 — Leer el mock

**Acción:** Abre `src/test/java/mock/pedidos.feature`. Localiza `pathMatches` y la asignación de `response`.

**Por qué:** Ahí está el contrato falso. Cambiar el mock cambia el test.

**Resultado esperado:** ves el Scenario catch-all `404`.

### 3 — curl interno (opcional)

**Acción:** No hace falta para el lab. Si quieres ver el puerto, el log de Karate imprime el mock. Desde **otra** terminal del Codespace, `curl` a `localhost:<puerto>/pedidos/77` solo funciona **mientras el test está vivo** (casi nunca). Mejor quédate con el informe.

**Por qué:** El mock vive lo que dura la ejecución. No es un servicio de aula permanente.

**Resultado esperado:** no dependas de curl para dar el módulo por hecho.

### 4 — POST en el mock

El mock de pedidos **ya incluye** un POST `/pedidos` (201, `estado: creado`) y `pedidos.feature` lo cubre. Lee ambos ficheros y relanza `@m07`: deben pasar 2 escenarios.

Si quieres practicar, cambia el `estado` del POST a `pendiente` en el mock y en el match — y vuelve a dejarlo como está.

## Comprueba tu entendimiento

**Suite completa**

`mvn test`

→ Todos los tags en verde, incluido `@m07`. Es el cierre del curso.

## Reto

### 1 — 404 de pedido

Haz GET `pedidos/no-aplica`… espera: `pathMatches('/pedidos/{id}')` **sí** casa. El catch-all no se usa para GET con id.

<details>
<summary>Ver solución</summary>

Para un 404 real en GET, el mock tiene que ramificar (por ejemplo `pathParams.id == '0'` → 404). El catch-all cubre métodos/rutas no definidos (un GET `/foo`). Prueba `Given path 'foo'` y `status 404`.

</details>

## Errores frecuentes

| Síntoma | Causa probable | Cómo arreglarlo |
|---------|----------------|-----------------|
| `match id == 77` falla | El mock devuelve string `'77'` | `== '77'` o `parseInt` en el mock |
| Connection refused | `url baseUrl` en vez del puerto del `karate.start` | `url 'http://localhost:' + mock.port` |
| El POST cae en 404 | El Scenario POST va **después** del catch-all vacío | En Karate el catch-all es el último `Scenario:` sin condición; déjalo el último |
