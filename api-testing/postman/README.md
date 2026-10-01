# API Testing con Postman

Proyecto práctico de pruebas de API realizado con Postman utilizando JSONPlaceholder.

## Objetivo

Practicar la ejecución y validación de servicios REST, incluyendo escenarios positivos y negativos, uso de variables de entorno y validaciones automatizadas con JavaScript.

## Herramientas

- Postman
- JSONPlaceholder REST API
- JavaScript
- GitHub

## Requests probados

### 01 - GET - Consultar usuario por ID
- Consulta de usuario mediante ID.
- Uso de variables `{{baseUrl}}` y `{{userId}}`.
- Validación de status `200 OK`.
- Validación del ID solicitado.
- Validación de campos requeridos: `id`, `name`, `username` y `email`.
- Escenario negativo con usuario inexistente.
- Validación de `404 Not Found` y respuesta vacía.

### 02 - POST - Crear usuario
- Creación simulada de usuario.
- Validación de status `201 Created`.
- Validación de ID en la respuesta.
- Validación de los datos enviados.

### 03 - PUT - Actualizar usuario
- Actualización simulada de un usuario.
- Validación de status `200 OK`.
- Validación del ID.
- Validación de los datos actualizados.

### 04 - DELETE - Eliminar usuario
- Eliminación simulada de usuario.
- Validación de status `200 OK`.
- Validación de respuesta vacía.

## Validaciones automatizadas

Se utilizaron scripts de Postman con JavaScript y assertions como:

```javascript

pm.test("Status code es 200", function () {
    pm.response.to.have.status(200);
});

pm.expect(respuesta.id).to.eql(userId);
pm.expect(respuesta).to.have.property("email");
```

También se utilizó lógica condicional if/else para validar diferentes comportamientos según el escenario de prueba.
Variables de entorno

```
baseUrl = https://jsonplaceholder.typicode.com
userId = 3
```

Esto permite reutilizar los requests y modificar los datos de prueba sin cambiar manualmente las URLs.

## Resultado
Se ejecutaron correctamente pruebas positivas y negativas para operaciones GET, POST, PUT y DELETE, validando códigos HTTP, estructura JSON y datos de respuesta.
