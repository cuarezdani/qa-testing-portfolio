-- =====================================================
-- PROYECTO: SQL Testing - Sistema de Clientes y Pedidos
-- ARCHIVO: 02_insert_test_data.sql
-- OBJETIVO: Insertar datos para pruebas funcionales
--           y validación de reglas de negocio.
-- BASE DE DATOS: QA_Testing
-- =====================================================

USE QA_Testing;
GO

-- =====================================================
-- TABLA: customers
-- Datos de prueba: 7 clientes
--
-- Casos intencionales:
-- 1. Maria Lopez tiene email NULL (REQ-001).
-- 2. Carlos Perez y Daniel Soto comparten email
--    para validar duplicados (REQ-002).
-- =====================================================

INSERT INTO dbo.customers
    (customer_id, name, email, city, status)
VALUES
    (1, 'Ana Torres', 'ana@email.com', 'Santiago', 'Active'),
    (2, 'Carlos Perez', 'carlos@email.com', 'Valparaiso', 'Active'),
    (3, 'Maria Lopez', NULL, 'Santiago', 'Active'),
    (4, 'Pedro Gonzalez', 'pedro@email.com', 'Concepcion', 'Inactive'),
    (5, 'Laura Martinez', 'laura@email.com', 'Santiago', 'Active'),
    (6, 'Daniel Soto', 'carlos@email.com', 'Temuco', 'Active'),
    (7, 'Sofia Ramirez', 'sofia@email.com', 'Santiago', 'Blocked');

GO

-- =====================================================
-- TABLA: orders
-- Datos de prueba: 6 pedidos
--
-- Casos intencionales:
-- 1. Pedido 103: customer_id = 99 no existe (REQ-005).
-- 2. Pedido 105: monto negativo -5000 (REQ-006).
-- =====================================================

INSERT INTO dbo.orders
    (order_id, customer_id, order_date, amount, status)
VALUES
    (101, 1, '2026-09-01', 25000.00, 'Completed'),
    (102, 3, '2026-09-02', 18990.00, 'Pending'),
    (103, 99, '2026-09-03', 45000.00, 'Completed'),
    (104, 5, '2026-09-04', 32000.00, 'Cancelled'),
    (105, 2, '2026-09-05', -5000.00, 'Completed'),
    (106, 7, '2026-09-06', 15990.00, 'Pending');

GO