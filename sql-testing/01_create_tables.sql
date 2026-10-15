-- =====================================================
-- PROYECTO: SQL Testing - Sistema de Clientes y Pedidos
-- AUTOR: Daniela Cuarez
-- OBJETIVO: Crear las tablas para ejecutar pruebas
--           de validación de datos y reglas de negocio.
-- BASE DE DATOS: QA_Testing
-- =====================================================

USE QA_Testing;
GO

-- =====================================================
-- TABLA 1: customers
-- Almacena la información de los clientes.
-- =====================================================

CREATE TABLE dbo.customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150),
    city VARCHAR(100),
    status VARCHAR(20)
);
GO

-- =====================================================
-- TABLA 2: orders
-- Almacena los pedidos realizados por los clientes.
-- =====================================================

CREATE TABLE dbo.orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    status VARCHAR(20) NOT NULL
);
GO