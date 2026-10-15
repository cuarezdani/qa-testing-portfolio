# SQL Testing – Sistema de Clientes y Pedidos

## Descripción del proyecto

Proyecto práctico de QA Testing enfocado en la validación de datos y reglas de negocio mediante consultas SQL.

Se utiliza una base de datos de prueba llamada `QA_Testing`, que contiene información simulada de clientes y pedidos. El objetivo es identificar inconsistencias, comprobar restricciones y documentar los resultados de las pruebas.

## Herramientas utilizadas

- Microsoft SQL Server Express
- SQL Server Management Studio (SSMS)
- SQL (T-SQL)
- GitHub para documentación del proyecto

## Base de datos

El proyecto contiene dos tablas:

- **customers:** información de clientes, incluyendo identificador, nombre, correo electrónico, ciudad y estado.
- **orders:** información de pedidos, incluyendo identificador, cliente asociado, fecha, monto y estado.

Los datos son ficticios e incluyen inconsistencias intencionales para practicar la identificación de defectos.

## Casos de prueba

| ID | Validación | Resultado |
|---|---|---|
| TC-SQL-001 | Verificar que todos los clientes tengan email | FAIL |
| TC-SQL-002 | Verificar que los emails no estén duplicados | FAIL |
| TC-SQL-003 | Validar estados permitidos de clientes | PASS |
| TC-SQL-004 | Validar nombre obligatorio | PASS |
| TC-SQL-005 | Verificar que cada pedido pertenezca a un cliente existente | FAIL |
| TC-SQL-006 | Verificar que el monto de cada pedido sea mayor que cero | FAIL |
| TC-SQL-007 | Validar estados permitidos de pedidos | PASS |

## Resultados

**Total de casos ejecutados:** 7

- **PASS:** 3
- **FAIL:** 4

Se identificaron las siguientes inconsistencias:

- Un cliente sin correo electrónico.
- Un correo electrónico utilizado por dos clientes.
- Un pedido asociado a un cliente inexistente.
- Un pedido con monto negativo.

Los resultados FAIL corresponden a incumplimientos de las reglas de negocio en los datos simulados.

También se realizó una prueba negativa para verificar que SQL Server rechazara la inserción de un cliente sin nombre, mediante la restricción `NOT NULL`.

## Técnicas y conocimientos aplicados

- Validación de reglas de negocio.
- Pruebas funcionales de datos.
- Pruebas positivas y negativas.
- Verificación de integridad referencial.
- Identificación de valores nulos y duplicados.
- Consultas `SELECT`, `WHERE`, `GROUP BY`, `HAVING` y `LEFT JOIN`.
- Documentación de resultados esperados y obtenidos.

## Archivos del proyecto

- `01_create_tables.sql`: creación de las tablas.
- `02_insert_test_data.sql`: carga de datos simulados.
- `03_validation_tests.sql`: ejecución de validaciones SQL.

## Cómo ejecutar el proyecto

1. Crear una base de datos de prueba llamada `QA_Testing` en SQL Server.
2. Ejecutar `01_create_tables.sql` para crear las tablas.
3. Ejecutar `02_insert_test_data.sql` para cargar los datos.
4. Ejecutar `03_validation_tests.sql` para validar las reglas de negocio.
5. Comparar los resultados obtenidos con los documentados.

**Nota:** Los scripts de creación e inserción están pensados para una base de datos de prueba vacía. No deben ejecutarse repetidamente sobre las tablas ya pobladas.

## Objetivo profesional

Este proyecto forma parte de mi portafolio de QA Testing y demuestra mi práctica en validación de datos, consultas SQL, análisis de inconsistencias y documentación de casos de prueba.
