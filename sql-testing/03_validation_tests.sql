
-- =====================================================
-- PROYECTO: SQL Testing - Sistema de Clientes y Pedidos
-- ARCHIVO: 03_validation_tests.sql
-- OBJETIVO: Validar reglas de negocio mediante SQL
-- BASE DE DATOS: QA_Testing
-- RESULTADOS: 3 PASS / 4 FAIL
-- =====================================================

USE QA_Testing;
GO

-- TC-SQL-001 | REQ-001: Email obligatorio
-- Esperado: 0 registros
-- Obtenido: 1 cliente (customer_id = 3)
-- Estado: FAIL

SELECT customer_id, name, email
FROM dbo.customers
WHERE email IS NULL;


-- TC-SQL-002 | REQ-002: Email único
-- Esperado: 0 registros
-- Obtenido: 1 email duplicado
-- Estado: FAIL

SELECT email, COUNT(*) AS cantidad
FROM dbo.customers
WHERE email IS NOT NULL
GROUP BY email
HAVING COUNT(*) > 1;


-- TC-SQL-003 | REQ-003: Estados válidos de clientes
-- Permitidos: Active, Inactive, Blocked
-- Esperado: 0 registros
-- Obtenido: 0 registros
-- Estado: PASS

SELECT customer_id, name, status
FROM dbo.customers
WHERE status NOT IN ('Active', 'Inactive', 'Blocked')
   OR status IS NULL;


-- TC-SQL-004 | REQ-004: Nombre obligatorio
-- Esperado: 0 registros
-- Obtenido: 0 registros
-- Estado: PASS

SELECT customer_id, name
FROM dbo.customers
WHERE name IS NULL;

-- Prueba negativa adicional:
-- Se intentó insertar un cliente con name = NULL.
-- SQL Server rechazó la inserción por NOT NULL.
-- Resultado: PASS
--
-- Ejecutar individualmente solo si se desea repetir:
-- INSERT INTO dbo.customers
--     (customer_id, name, email, city, status)
-- VALUES
--     (8, NULL, 'prueba@email.com', 'Santiago', 'Active');


-- TC-SQL-005 | REQ-005: Cliente existente por pedido
-- Esperado: 0 registros
-- Obtenido: 1 pedido (order_id = 103, customer_id = 99)
-- Estado: FAIL

SELECT o.order_id, o.customer_id
FROM dbo.orders AS o
LEFT JOIN dbo.customers AS c
    ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;


-- TC-SQL-006 | REQ-006: Monto mayor que cero
-- Esperado: 0 registros
-- Obtenido: 1 pedido (order_id = 105)
-- Estado: FAIL

SELECT order_id, amount
FROM dbo.orders
WHERE amount <= 0;


-- TC-SQL-007 | REQ-007: Estados válidos de pedidos
-- Permitidos: Completed, Pending, Cancelled
-- Esperado: 0 registros
-- Obtenido: 0 registros
-- Estado: PASS

SELECT order_id, status
FROM dbo.orders
WHERE status NOT IN ('Completed', 'Pending', 'Cancelled')
   OR status IS NULL;
  